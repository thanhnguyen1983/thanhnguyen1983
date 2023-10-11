import 'dart:async';
import 'package:humanweb/api/RemoteApi.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';
import 'character_sliver_grid_states.dart';
class CharacterSliverGridBloc {
  CharacterSliverGridBloc() {
    _onPageRequest.stream
        .flatMap(_fetchCharacterSummaryList)
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);

    _onSearchInputChangedSubject.stream
        .flatMap((_) => _resetSearch())
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);
  }

  static const _pageSize = 20;
  SystemController systemController=Get.find();
  final _subscriptions = CompositeSubscription();

  final _onNewListingStateController =
  BehaviorSubject<CharacterListingState>.seeded(
    CharacterListingState(),
  );

  Stream<CharacterListingState> get onNewListingState =>
      _onNewListingStateController.stream;

  final _onPageRequest = StreamController<int>();

  Sink<int> get onPageRequestSink => _onPageRequest.sink;

  final _onSearchInputChangedSubject = BehaviorSubject<String>();

  Sink<String> get onSearchInputChangedSink =>
      _onSearchInputChangedSubject.sink;

  String? get searchInputValue => _onSearchInputChangedSubject.value;

  Stream<CharacterListingState> _resetSearch() async* {
    yield CharacterListingState();
    yield* _fetchCharacterSummaryList(0);
  }

  Stream<CharacterListingState> _fetchCharacterSummaryList(int pageKey) async* {
    final lastListingState = _onNewListingStateController.value;
    try {
      final newItems = await RemoteApi.getCharacterList(
        REF_ID: systemController.username.value,
        offset:
        pageKey,
        limit:_pageSize,
        STY:systemController.STY.value,
        YYYY:systemController.YYYY.value,
        MM:systemController.MM.value,
        searchTerm: searchInputValue,
      );
      final isLastPage = newItems.length < _pageSize;
      final nextPageKey = isLastPage ? null : pageKey + newItems.length;
      yield CharacterListingState(
        error: null,
        nextPageKey: nextPageKey,
        itemList: [...lastListingState!.itemList ?? [], ...newItems],
      );
    } catch (e) {
      yield CharacterListingState(
        error: e,
        nextPageKey: lastListingState!.nextPageKey,
        itemList: lastListingState.itemList,
      );
    }
  }

  void dispose() {
    _onSearchInputChangedSubject.close();
    _onNewListingStateController.close();
    _subscriptions.dispose();
    _onPageRequest.close();
  }
}
