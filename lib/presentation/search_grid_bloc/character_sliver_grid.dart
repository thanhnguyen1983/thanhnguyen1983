import 'dart:async';

import 'package:flutter/material.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/presentation/common/character_search_input_sliver.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'character_grid_item.dart';
import 'character_sliver_grid_bloc.dart';
class CharacterSliverGrid extends StatefulWidget {
  @override
  _CharacterSliverGridState createState() => _CharacterSliverGridState();
}

class _CharacterSliverGridState extends State<CharacterSliverGrid> {
  final CharacterSliverGridBloc _bloc = CharacterSliverGridBloc();
  final PagingController<int, FILB01A> _pagingController =
  PagingController(firstPageKey: 0);
  late StreamSubscription _blocListingStateSubscription;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _bloc.onPageRequestSink.add(pageKey);
    });

    // We could've used StreamBuilder, but that would unnecessarily recreate
    // the entire [PagedSliverGrid] every time the state changes.
    // Instead, handling the subscription ourselves and updating only the
    // _pagingController is more efficient.
    _blocListingStateSubscription =
        _bloc.onNewListingState.listen((listingState) {
          _pagingController.value = PagingState(
            nextPageKey: listingState.nextPageKey,
            error: listingState.error,
            itemList: listingState.itemList,
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: <Widget>[
      CharacterSearchInputSliver(
        onChanged: (searchTerm) => _bloc.onSearchInputChangedSink.add(
          searchTerm,
        ),
      ),
      PagedSliverGrid<int, FILB01A>(
        pagingController: _pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 150,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        builderDelegate: PagedChildBuilderDelegate<FILB01A>(
          itemBuilder: (context, item, index) => CharacterGridItem(
            character: item,
          ),
        ),
      ),
    ],
  );

  @override
  void dispose() {
    _pagingController.dispose();
    _blocListingStateSubscription.cancel();
    _bloc.dispose();
    super.dispose();
  }
}