import '../components/filb01a.dart';


import 'package:get/get.dart' as Getx;
import 'package:http/http.dart';


import 'dart:convert';

import '../state/filb01acontroller.dart';
import '../state/statuscodecontroller.dart';
import '../utilities/constants.dart';
class ApiLogin
{

  static StatusCodeController statusCodeController=Getx.Get.find();
  static Future<List<FILB01A>> Login(String EMP_ID,String pass) async
  {
    // var where = 'FILB01A/Login/Login?EMP_ID=$EMP_ID&Password=$pass';
    // print(kApiurl + where);
    // Response res = await get(Uri.parse(kApiurl + where),headers: <String, String>{
    //
    //  'Access-Control-Allow-Origin': 'http://humanapi.ddns.net:5725',
    //  'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
    //  });
    Filb01aController filb01aController=Getx.Get.find();
    //statusCodeController.initStatusCode();
    // Response res = await post(Uri.parse('${kApiurl}Authenticate/login'),);

    final url = "${kApiurl}Authenticate/login";
    final body={
      'Username': EMP_ID,
      'Password': pass
    };
    print(body);
    print('json ${jsonEncode(body)}');
    print('start login');
    Response res = await post(Uri.parse(url),headers: <String, String>{
      'Access-Control-Allow-Origin': '*',
      "Accept": "application/json",
      'Content-Type': 'application/json',
    },
      body:jsonEncode(body),
    );
    print(res.statusCode);
    // statusCodeController.statuscode.value=res.statusCode;
    //print('code ${statusCodeController.statuscode.value}');
    statusCodeController.statuscode.value=res.statusCode;
    if (res.statusCode == 200) {
      print('ket noi thang cong ${res.body}');
      List<dynamic> body = jsonDecode(res.body);
      //systemController.isOK.value==true;


      var l=body.map((dynamic item) => FILB01A.fromJson(item)).toList();
      //filb01aController.addItem(l);

      //print('code ${statusCodeController.statuscode.value}');

      return body.map((dynamic item) => FILB01A.fromJson(item)).toList();
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<String> getPassWord(String EMP_ID,String EML_DR) async
  {
    final url = "${kApiurl}FILB01A/forgotpass/getPassWord?emp_id=$EMP_ID&email=$EML_DR";

    print(url);
    Response res = await get(Uri.parse(url), headers: <String, String>{
      'Access-Control-Allow-Origin': '*',
      "Accept": "application/json",
      'Content-Type': 'application/json',
    });


    if (res.statusCode == 200)
    {
      print(res.body);
      return res.body;
    }
    else {
      print('cannot connect');
      throw('Error');
    }

  }

}