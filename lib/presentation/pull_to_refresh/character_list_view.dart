import 'package:flutter/material.dart';
import 'package:humanweb/api/RemoteApi.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/presentation/common/character_list_item.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
class CharacterListView extends StatefulWidget {


  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  static const _pageSize = 20;
  SystemController systemController=Get.find();
  final PagingController<int, FILB01A> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await RemoteApi.getCharacterList(REF_ID:systemController.username.value ,offset: pageKey,limit:_pageSize,STY:systemController.STY.value,YYYY: systemController.YYYY.value,MM:systemController.MM.value);

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch(error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
    ),
    child: PagedListView<int, FILB01A>.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FILB01A>(
        itemBuilder: (context, item, index) => CharacterListItem(
          character: item,
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    ),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
