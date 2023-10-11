import 'package:flutter/material.dart';
import 'package:humanweb/api/RemoteApi.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/presentation/common/character_list_item.dart';
import 'package:humanweb/presentation/common/character_search_input_sliver.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
class CharacterSliverList extends StatefulWidget {
  @override
  _CharacterSliverListState createState() => _CharacterSliverListState();
}

class _CharacterSliverListState extends State<CharacterSliverList> {
  static const _pageSize = 17;
  SystemController systemController=Get.find();
  final PagingController<int, FILB01A> _pagingController =
  PagingController(firstPageKey: 0);

  String? _searchTerm;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    _pagingController.addStatusListener((status) {
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => _pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }
    });

    super.initState();
  }

  Future<void> _fetchPage(pageKey) async {
    try {
      final newItems = await RemoteApi.getCharacterList(
        REF_ID: systemController.username.value,
        offset:pageKey,
        limit:_pageSize,
        STY:systemController.STY.value,
        YYYY:systemController.YYYY.value,
        MM:systemController.MM.value,
        searchTerm: _searchTerm,
      );

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: <Widget>[
      CharacterSearchInputSliver(
        onChanged: (searchTerm) => _updateSearchTerm(searchTerm),
      ),
      PagedSliverList<int, FILB01A>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FILB01A>(
          itemBuilder: (context, item, index) => CharacterListItem(
            character: item,
          ),
        ),
      ),
    ],
  );

  void _updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
