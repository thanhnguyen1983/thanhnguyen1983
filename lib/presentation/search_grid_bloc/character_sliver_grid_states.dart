import 'package:humanweb/components/filb01a.dart';

class CharacterListingState {
  CharacterListingState({
    this.itemList,
    this.error,
    this.nextPageKey = 0,
  });

  final List<FILB01A>? itemList;
  final dynamic error;
  final int? nextPageKey;
}