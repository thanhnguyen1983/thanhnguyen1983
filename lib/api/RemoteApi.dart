import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:get/get.dart';
class RemoteApi {
  static SystemController systemController=Get.find();
  static final headers=<String,String>
  {

    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + systemController.token.value
  };
  static Future<List<FILB01A>> getCharacterList({
    required String REF_ID,
      required int offset,
      required int limit,
    required String YYYY,
    required String MM,
    String? searchTerm, required int STY,
      }) async =>
      http
          .get(
        _ApiUrlBuilder.characterList(REF_ID:REF_ID ,searchTerm: searchTerm, YYYY: YYYY, offset: offset,limit:limit, STY: STY, MM: MM),headers: headers,
      )
          .mapFromResponse<List<FILB01A>, List<dynamic>>(
            (jsonArray) => _parseItemListFromJsonArray(
          jsonArray,
              (jsonObject) => FILB01A.fromJson(jsonObject),
        ),
      );

  static List<T> _parseItemListFromJsonArray<T>(
      List<dynamic> jsonArray,
      T Function(dynamic object) mapper,
      ) =>
      jsonArray.map(mapper).toList();
}

class GenericHttpException implements Exception {}

class NoConnectionException implements Exception {}

class _ApiUrlBuilder {
  ////final url = "${kApiurl}FILB01A/GetFILB01A/GetFILB01A?OFFSET=$pageNumber&LIMIT=$pageSize";
  SystemController systemController=Get.find();
  static const _baseUrl = kApiurl;
  static const _charactersResource = 'FILB01A/GetFILB01A/GetFILB01A';

  static Uri characterList(
      {
        required String REF_ID,
      required int offset,
      required int limit,
      required int STY,
        required String YYYY,
        required String MM,


        String? searchTerm,
      }) =>
      Uri.parse(
        '$_baseUrl$_charactersResource?'
            'REF_ID=$REF_ID'
            '&offset=$offset'
            '&limit=$limit'
            '&STY=$STY'
            '&YYYY=$YYYY'
            '&MM=$MM'
            '${_buildSearchTermQuery(searchTerm)}',
      );


  static String _buildSearchTermQuery(String? searchTerm) =>
      searchTerm != null && searchTerm.isNotEmpty
          ? '&WHERE=${searchTerm.replaceAll(' ', '+').toLowerCase()}'
          : '';
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {
    try {
      final response = await this;
      if (response.statusCode == 200) {
        return jsonParser(jsonDecode(response.body));
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}
