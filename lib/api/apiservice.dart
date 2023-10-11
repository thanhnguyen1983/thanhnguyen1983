import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:humanweb/components/SYS_GROUP_DEP.dart';
import 'package:humanweb/components/SYS_SECURITY.dart';
import 'package:humanweb/components/dashboardclass.dart';
import 'package:humanweb/components/fila15a.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/components/filb01ac.dart';
import 'package:humanweb/components/filc01a.dart';
import 'package:humanweb/components/filc02a.dart';
import 'package:humanweb/components/filc02b.dart';
import 'package:humanweb/components/filc03a.dart';
import 'package:humanweb/components/filc04a.dart';
import 'package:humanweb/components/filc04b.dart';
import 'package:humanweb/components/filc06a.dart';
import 'package:humanweb/components/filc06aa.dart';
import 'package:humanweb/components/fild01a.dart';
import 'package:humanweb/components/gp_sys_shift.dart';
import 'package:humanweb/components/location.dart';
import 'package:humanweb/components/objectvacation.dart';
import 'package:humanweb/components/sys_label_vs.dart';
import 'package:humanweb/components/sys_menu.dart';
import 'package:humanweb/components/sys_notification.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:get/get.dart' as Getx;
import 'dart:convert' show utf8;
import 'dart:io';

import '../components/SYS_GROUP.dart';
import '../components/SYS_USER.dart';
import '../components/filc04aa.dart';
import '../components/fild02a.dart';
import '../components/fild03a.dart';
import '../components/getds.dart';
import '../utilities/utility.dart';
class ApiService
{
  static int STR_DR=0;
  static StatusCodeController statusCodeController=Getx.Get.find();
  static SystemController systemController=Getx.Get.find();
  static Filb01aController loginController=Getx.Get.find();
  static final headers=<String,String>
  {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + loginController.items[0].token.toString()
  };

  static Future<List<DashBoardClass>> getDashBoard(int yyyy,int mm)async
  {
    Response res = await get(Uri.parse(kApiurl+'DashBoard/getDashBoard?yyyy=$yyyy&MM=$mm&REF_ID=${systemController.username}'),headers: headers);
    print(kApiurl+'DashBoard/getDashBoard?yyyy=$yyyy&MM=$mm&REF_ID=${systemController.username}');
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<DashBoardClass> users = body.map((dynamic item) => DashBoardClass.fromJson(item))
          .toList();

      print('getDashBoard $users' );
      return users;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }
  static Future<List<sbmfrmSecurity_vs>> getSYSGROUP() async
  {


    String sql=" SELECT ROW_NUMBER() OVER (ORDER BY GROUP_ID) AS SEQ_NO,GROUP_ID, GROUP_NM, COM_ID FROM SYS_GROUP WHERE isnull(COM_ID,'')<>''  ";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => sbmfrmSecurity_vs.fromJson(item)).toList();
    /////
    return list;


  }

  static Future<List<SYS_GROUP_DEP>> getSYSGROUPDEP(String COM_ID,String GROUP_ID) async
  {


    String sql=" SELECT ROW_NUMBER() OVER (ORDER BY a.DEP_ID) AS SEQ_NO ,ISNULL(b.DEP_VN, N'') + ISNULL(b.DEP_CH, N'') AS DEP_NM, b.COM_ID, a.GROUP_ID, a.DEP_ID, ISNULL(a.APV_FG, N'') AS APV_FG FROM SYS_GROUP_DEP AS a INNER JOIN FILA02A AS b ON a.DEP_ID = b.DEP_ID  WHERE COM_ID='$COM_ID' AND a.GROUP_ID='$GROUP_ID'";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => SYS_GROUP_DEP.fromJson(item)).toList();
    /////
    return list;


  }
  static Future<List<SYS_SECURITY>> getSYSSECURITY(String GROUP_ID) async
  {


    String sql=" SELECT ROW_NUMBER() OVER (ORDER BY H_ID,ID) AS SEQ_NO ,H_ID,a.GROUP_ID, a.MNU_ID, b.VN + ISNULL(b.CH, '') AS MNU_NM, a.[ADD], a.[UPDATE], a.[DELETE], a.USAGE, a.[PRINT],isnull(a.APV_BT,0) as APROVAL   FROM SYS_SECURITY AS a INNER JOIN SYS_MENU AS b ON a.MNU_ID = b.ID WHERE a.GROUP_ID='$GROUP_ID' ";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => SYS_SECURITY.fromJson(item)).toList();
    /////
    return list;


  }

  static Future<List<SYS_MENU>> getSYSMENU() async
  {


    String sql=" SELECT ID, H_ID, SEQ, ISNULL(HIDE, 0) AS HIDE, EN, VN, CH, SEC, TT, FRAME, ISNULL(DEP_BT, 0) AS DEP_BT, ISNULL(TYP_BT, 0) AS TYP_BT, ISNULL(TRE_FG, 0) AS TRE_FG, COL_NO, SEQ_NO, ISNULL(COM_ID, '') AS COM_ID FROM  SYS_MENU WHERE (H_ID = - 1) ORDER BY SEQ ";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => SYS_MENU.fromJson(item)).toList();
    /////
    return list;


  }


  static Future<List<SYSUSER>> getSYSUSER(String GROUP_ID) async
  {


    String sql="  SELECT ROW_NUMBER() OVER (ORDER BY a.USER_ID) AS SEQ_NO,a.GROUP_ID, a.USER_ID, ISNULL(b.EMP_NM, N'') AS USER_NAME, ISNULL(a.GPS_FG, 0) AS GPS_FG, a.USE_FG FROM SYS_USER AS a LEFT OUTER JOIN FILB01A AS b ON a.STF_ID = b.EMP_ID WHERE a.GROUP_ID='$GROUP_ID'";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => SYSUSER.fromJson(item)).toList();
    /////
    return list;


  }
  static Future<List<FILD02A>> getFILD02ANew(String EMP_ID,String YYYYMM) async
  {


    String sql="SELECT * FROM FILD02A WHERE EMP_ID=N'${EMP_ID}' and YYY_MM=N'${YYYYMM}' and SEQ_NO=2";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => FILD02A.fromJson(item)).toList();
    /////
    return list;


  }
  static Future<List<FILC06A>> getFILC06ANew(String EMP_ID,String dt1,String dt2) async
  {


    String sql="SELECT * FROM FILC06A WHERE EMP_ID=N'${EMP_ID}' and ATT_DT BETWEEN N'"+dt1+"' and N'"+dt2+"'";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => FILC06A.fromJson(item)).toList();
    /////
    return list;


  }
  static Future<List<FILC06AA>> getFILC06AANew(String EMP_ID,String YYYYMM) async
  {


    String sql="SELECT * FROM FILC06AA WHERE EMP_ID=N'${EMP_ID}' and YYY_MM=N'${YYYYMM}' and SEQ_NO=2 and MOB_FG=1";

    List<dynamic> body=jsonDecode(await ApiService.sbmsysRecordset(sql));

    var list= body.map((dynamic item) => FILC06AA.fromJson(item)).toList();
    /////
    return list;


  }





  static Future<String> sbmsysRecordset(String where)async
  {


    GetDS item=GetDS(sselect: Utility.encryptString(where),suser: "",sty: Utility.encryptString('sbmsysRecordset'),listselect: [""]);

    if (kDebugMode) {
      print(jsonEncode(item));
    }
    const url = "${kApiurl}GetDS/sbmsysRecordset";
    var res = await post(
        Uri.parse('${kApiurl}GetDS/sbmsysRecordset'),
        headers: headers,
        body: jsonEncode(item));

    //  print(res.statusCode);

    if (res.statusCode == 200)
    {
      var s="";
      if(res.body.isNotEmpty) {
        s = res.body.replaceAll(r'\"', '"').substring(1);
        s=s.substring(0,s.length-1);
      }
      if (kDebugMode) {
        print(s);
      }
      // print (res.body.replaceAll(r'\"', '"'));
      //return res.body.replaceAll(r'\"', '"');
      return s;
    }
    else {
      print('cannot connect $where');
      throw('Error');
    }
  }
  static Future<int> ExecuteSql(GetDS obj)async
  {
    print('ExecuteSql');
    List<String> list=<String>[];

    GetDS item=GetDS(sselect: '',suser: "",sty:Utility.encryptString('ExecuteSql'));
    for (var element in obj.listselect!) {
      list.add(Utility.encryptString(element));
      print(element);
    }

    item.listselect=list;
    print(jsonEncode(item));

    final url = "${kApiurl}GetDS/ExecuteSql";
    var res = await post(
        Uri.parse('${kApiurl}GetDS/ExecuteSql'),
        headers: headers,
        body: jsonEncode(item));
    if (res.statusCode == 200)
    {
      //  List<dynamic> body = jsonDecode(res.body);
      return 200;
    }
    else {
      return -200;
      print('cannot connect');
      throw('Error');
    }
  }



  static Future<String> getFILD02A(String EMP_ID,String YYYYMM)async
  {
    Response res = await get(Uri.parse(kApiurl+'FILD02A/EMP_ID,YYYYMM?EMP_ID=$EMP_ID&YYYYMM=$YYYYMM'),headers: headers);
    if (res.statusCode == 200)
      {
        return res.body;
      }else {
      print('cannot connect');
      throw('Error');
    }
  }
  static Future<List<FILD01A>> getFILD01A()async
  {
    final url = "${kApiurl}FILD01A";

    Response res = await get(Uri.parse(url),headers: headers);
    if (res.statusCode == 200)
    {
      List<dynamic> body = jsonDecode(res.body);
      List<FILD01A> list = body.map((dynamic item) => FILD01A.fromJson(item))
          .toList();
      return list;
    }
    else {
      print('cannot connect');
      throw('Error');
    }
  }



  /*static Future<List<FILB01A>> Login(String EMP_ID,String pass) async
  {

    Filb01aController filb01aController=Getx.Get.find();


    final url = "${kApiurl}Authenticate/login";
    final body={
      'username': EMP_ID,
      'password': pass
    };

    Response res = await post(Uri.parse(url),headers: <String, String>{
    'Access-Control-Allow-Origin': '*',
      "Accept": "application/json",
      'Content-Type': 'application/json',
    },
      body:jsonEncode(body),
    );

    statusCodeController.statuscode.value=res.statusCode;
    print(res.body);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      print(res.body);

      var l=body.map((dynamic item) => FILB01A.fromJson(item)).toList();
      filb01aController.addItem(l);
      return body.map((dynamic item) => FILB01A.fromJson(item)).toList();
    } else {
      print('cannot connect');
      throw('Error');
    }
  }*/
static Future<List<FILB01A>> getFILB01A(pageNumber, int pageSize) async
{
  //https://localhost:44367/api/FILB01A/GetFILB01A/123?OFFSET=1&LIMIT=10
  final url = "${kApiurl}FILB01A/GetFILB01A/GetFILB01A?OFFSET=$pageNumber&LIMIT=$pageSize";

  Response res = await get(Uri.parse(url),headers: headers);

  if (res.statusCode == 200)
    {
      List<dynamic> body = jsonDecode(res.body);
      List<FILB01A> users = body.map((dynamic item) => FILB01A.fromJson(item))
          .toList();
      return users;
    }
  else {
    print('cannot connect');
    throw('Error');
  }
}

/*static Future<String> getPassWord(String EMP_ID,String EML_DR) async
{
  final url = "${kApiurl}FILB01A/forgotpass/getPassWord?emp_id=$EMP_ID&email=$EML_DR";

print(url);
  Response res = await get(Uri.parse(url),headers: headers);


  if (res.statusCode == 200)
  {
    print(res.body);
    return res.body;
  }
  else {
    print('cannot connect');
    throw('Error');
  }

}*/

  static Future<String> getSignUp(String EMP_ID,String EML_DR,String Pass) async
  {


    final url = "${kApiurl}Authenticate/register";
    final body={
      'username': EMP_ID,
      'email': EML_DR,
      'password': Pass
    };

    Response res = await post(Uri.parse(url),headers: <String, String>{
      "Accept": "application/json",
      'Content-Type': 'application/json',
    },
      body:jsonEncode(body),
    );


    if (res.statusCode == 200)
    {
      return res.body;
    }
    else {
      print('cannot connect');
      return res.body;
      throw(res.body);
    }

  }

  static Future<String> changePassword(String EMP_ID,String EML_DR,String Pass) async
  {


    final url = "${kApiurl}Authenticate/changepassword";
    final body={
      'username': EMP_ID,
      'email': EML_DR,
      'password': Pass
    };

    Response res = await post(Uri.parse(url),headers: <String, String>{
      "Accept": "application/json",
      'Content-Type': 'application/json',
    },
      body:jsonEncode(body),
    );
    print('changePassword statusCode ${res.statusCode}');

    if (res.statusCode == 200)
    {
      return res.body;
    }
    else {
      print('cannot connect');
      throw(res.body);
    }

  }


static Future<List<FILB01AC>> getFILB01AC(int yyyy)async
{
  Response res = await get(Uri.parse(kApiurl +'FILB01AC/$yyyy'),headers: headers);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);


    List<FILB01AC> users = body.map((dynamic item) => FILB01AC.fromJson(item))
        .toList();
    return users;
  } else {
    print('cannot connect');
    throw('Error');
  }

}

  static Future<List<FILB01AC>> getFILB01ACMonth(int yyyy,int mm)async
  {
    Response res = await get(Uri.parse(kApiurl +'FILB01AC/byMonth?yyyy=$yyyy&MM=$mm'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      List<FILB01AC> users = body.map((dynamic item) => FILB01AC.fromJson(item))
          .toList();
      return users;
    } else {
      print('cannot connect');
      throw('Error');
    }

  }

  static Future<List<FILC01A>> dtFILC01A(String EMP_ID,String dt1,String dt2)async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC01A/GetFILC01A/dtFILC01A?EMP_ID=$EMP_ID&dt1=$dt1&dt2=$dt2'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      print(body);
      //List jsonResponse = json.decode(res.body);
      List<FILC01A> users = body.map((dynamic item) => FILC01A.fromJson(item))
          .toList();
    
      return users;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }


  // print('wifiBSSID $wifiBSSID');
  // print('wifiIP $wifiIP');
  // print('wifiName $wifiName');

  static Future<List<FILC01A>> getFILC01A(String EMP_ID,String dt,String gett,double LAT,double LON,String ADD,String wifiBSSID,String wifiIP,String wifiName) async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    statusCodeController.initStatusCode();

    if (connectivityResult == ConnectivityResult.mobile) {
      STR_DR=2;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      STR_DR=1;
    }
    print(kApiurl +'FILC01A/FILC01A?EMP_ID=$EMP_ID&dt=$dt&get=$gett&STR_DR=$STR_DR&LAT=$LAT&LON=$LON&ADD=$ADD');

    Response res = await get(Uri.parse(kApiurl +'FILC01A/FILC01A?EMP_ID=$EMP_ID&dt=$dt&get=$gett&STR_DR=$STR_DR&LAT=$LAT&LON=$LON&ADD=$ADD&wifiBSSID=$wifiBSSID&wifiIP=$wifiIP&wifiName=$wifiName'),headers: headers);

    statusCodeController.statuscode.value=res.statusCode;

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

        print(json.decode(res.body));
      //List jsonResponse = json.decode(res.body);
      List<FILC01A> users = body.map((dynamic item) => FILC01A.fromJson(item))
          .toList();
      return users;
    } else {
      final body = json.decode(res.body);
      print('${res.statusCode}     ${body['Message'].toString()}');

      statusCodeController.messenge.value=body['Message'].toString();
      print('statusCodeController ${statusCodeController.messenge.value.toString()}');
      print('end set ');
      print('cannot connect');
      List<FILC01A> users=[];
      return users;
      //throw('Error');
    }
  }

  static Future<List<FILA15A>> getFILA15A() async
  {

    //print('${kApiurl}SYS_USER?EMP_ID=$EMP_ID&IMG=$base64&upload=1');
    Response res = await get(Uri.parse(kApiurl +'FILA15A'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILA15A> fila15a = body.map((dynamic item) => FILA15A.fromJson(item))
          .toList();
      return fila15a;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<List<FILC02A>> getFILC02A() async
  {

    //print('${kApiurl}SYS_USER?EMP_ID=$EMP_ID&IMG=$base64&upload=1');
    Response res = await get(Uri.parse(kApiurl +'FILC02A'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC02A> filc02a = body.map((dynamic item) => FILC02A.fromJson(item))
          .toList();
      return filc02a;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  // static Future<List<FILC02B>> getFILC02B() async
  // {
  //
  //   //print('${kApiurl}SYS_USER?EMP_ID=$EMP_ID&IMG=$base64&upload=1');
  //   Response res = await get(Uri.parse(kApiurl +'FILC02B'));
  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);
  //
  //
  //     //List jsonResponse = json.decode(res.body);
  //     List<FILC02B> filc02b = body.map((dynamic item) => FILC02B.fromJson(item))
  //         .toList();
  //     return filc02b;
  //   } else {
  //     print('cannot connect');
  //     throw('Error');
  //   }
  // }
  static Future<List<FILC02B>> getFILC02B(String SHI_ID) async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC02B/$SHI_ID'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC02B> filc02b = body.map((dynamic item) => FILC02B.fromJson(item))
          .toList();
      return filc02b;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }



  static Future<List<FILC03A>> getFILC03A(String EMP_ID,String YYY_MM) async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC03A/FILC03A?EMP_ID=$EMP_ID&YYY_MM=$YYY_MM'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC03A> filc03a = body.map((dynamic item) => FILC03A.fromJson(item))
          .toList();
      return filc03a;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<List<FILC06A>> getFILC06A(String EMP_ID,String dt1,String dt2) async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC06A/FILC06A?EMP_ID=$EMP_ID&dt1=$dt1&dt2=$dt2'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC06A> filc06a = body.map((dynamic item) => FILC06A.fromJson(item))
          .toList();
      return filc06a;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<List<FILC06AA>> getFILC06AA(String EMP_ID,String YYY_MM) async
  {

    print(kApiurl +'FILC06AA?EMP_ID=$EMP_ID&YYY_MM=$YYY_MM');
    Response res = await get(Uri.parse(kApiurl +'FILC06AA/FILC06AA?EMP_ID=$EMP_ID&YYY_MM=$YYY_MM'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC06AA> filc06aa = body.map((dynamic item) => FILC06AA.fromJson(item))
          .toList();

      return filc06aa;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }
  static Future<List<FILC04A>> getFILC04A(String EMP_ID,String YYYY) async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC04A/FILC04A?EMP_ID=$EMP_ID&YYYY=$YYYY'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC04A> filc04a = body.map((dynamic item) => FILC04A.fromJson(item))
          .toList();
      print(filc04a[0].toJson());
      return filc04a;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }


  static Future<List<FILC04B>> getFILC04B(String EMP_ID,String YYYY) async
  {


    Response res = await get(Uri.parse(kApiurl +'FILC04B/FILC04B?EMP_ID=$EMP_ID&YYYY=$YYYY'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC04B> filc04b = body.map((dynamic item) => FILC04B.fromJson(item))
          .toList();
      print(filc04b[0].toJson());
      return filc04b;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }
  static Future<List<FILC04AA>> getFILC04AA(String EMP_ID,String YYYYMM,String sty) async
  {

    if(YYYYMM=='') {
      YYYYMM='999999';
    }

    String  urls=kApiurl +'FILC04AA/FILC04AA?EMP_ID=$EMP_ID&YYYYMM=$YYYYMM&sty=$sty';


    Response res = await get(Uri.parse(urls),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILC04AA> filc04aa = body.map((dynamic item) => FILC04AA.fromJson(item))
          .toList();
      print(filc04aa[0].toJson());
      return filc04aa;
    } else {
      print('cannot connect getFILC04AA $urls');
      throw('Error');
    }
  }
  static Future<List<FILD03A>> getFILD03A(String EMP_ID,String LAG_NM) async
  {



    String  urls=kApiurl +'FILD03A/getFILD03A?EMP_ID=$EMP_ID&LAG_NM=$LAG_NM';


    Response res = await get(Uri.parse(urls),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<FILD03A> fild03a = body.map((dynamic item) => FILD03A.fromJson(item))
          .toList();
      print(fild03a[0].toJson());
      return fild03a;
    } else {
      print('cannot connect getFILD03A $urls');
      throw('Error');
    }
  }


  static Future<List<SYS_LABEL_VS>> getSYS_LABEL_VS(String name) async
  {


    Response res = await get(Uri.parse(kApiurl +'SYS_LABEL_VS/$name'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<SYS_LABEL_VS> sys_label_vs = body.map((dynamic item) => SYS_LABEL_VS.fromJson(item))
          .toList();

      return sys_label_vs;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<List<SYS_NOTIFICATION>> getSYS_NOTIFICATION(String EMP_ID) async
  {

      print(kApiurl +'SYS_NOTIFICATION?EMP_ID=$EMP_ID');
    Response res = await get(Uri.parse(kApiurl +'SYS_NOTIFICATION/$EMP_ID'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<SYS_NOTIFICATION> list = body.map((dynamic item) => SYS_NOTIFICATION.fromJson(item))
          .toList();

      return list;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }
  static Future<List<SYS_NOTIFICATION>> getSYS_NOTIFICATIONALL(String EMP_ID,int all) async
  {

    print(kApiurl +'SYS_NOTIFICATION?EMP_ID=$EMP_ID&all=$all');
    Response res = await get(Uri.parse(kApiurl +'SYS_NOTIFICATION/getSYS_NOTIFICATION/SYS_NOTIFICATION?EMP_ID=$EMP_ID&all=$all'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<SYS_NOTIFICATION> list = body.map((dynamic item) => SYS_NOTIFICATION.fromJson(item))
          .toList();

      return list;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<String> approvalvacation(String SEQ_NO,int STY,int APV_FG,int DIS_FG,String EMP_ID)async
  {

    print('FILC04AA/GetApproval/approvalvacation?SEQ_NO=$SEQ_NO&STY=$STY&APV_FG=$APV_FG&DIS_FG=$DIS_FG&EMP_ID=$EMP_ID');
    Response res = await get(Uri.parse(kApiurl +'FILC04AA/GetApproval/approvalvacation?SEQ_NO=$SEQ_NO&STY=$STY&APV_FG=$APV_FG&DIS_FG=$DIS_FG&EMP_ID=$EMP_ID'),headers: headers);
    if (res.statusCode == 200)
    {
      statusCodeController.messenge.value=res.body;
      print(res.body);
      return res.body;

    }
    else
    {
      print('cannot connect');
      throw('Error');

    }
  }
  static Future<String> vacation(ObjectVacation item)async
  {

    Response res = await get(Uri.parse(kApiurl +'FILC04AA/GetFILC04AA/vacation?EMP_ID=${item.EMP_ID}&STR_DT=${item.STR_DT}&END_DT=${item.END_DT}&STR_TM=${item.STR_TM}&END_TM=${item.END_TM}&LEA_ID=${item.LEA_ID}'),headers: headers);
  print(kApiurl +'FILC04AA/GetFILC04AA/vacation?EMP_ID=${item.EMP_ID}&STR_DT=${item.STR_DT}&END_DT=${item.END_DT}&STR_TM=${item.STR_TM}&END_TM=${item.END_TM}&LEA_ID=${item.LEA_ID}');

    print(res.statusCode);

    if (res.statusCode == 200)
      {
        statusCodeController.messenge.value=res.body;
        print(res.body);
        return res.body;

      }
    else
      {
        print('cannot connect');
        throw('Error');

      }


  }
  static Future<int> postFILC04A(List<ObjectVacation> items)async
  {

   print(jsonEncode(items));

    var response = await post(
        Uri.parse('${kApiurl}FILC04A'),
        headers: headers,
        body: jsonEncode(items)
    );
    print(response.statusCode);
    return response.statusCode;

  }
  static Future<int> postCreateUser(SYSUSER item)async
  {

    print(jsonEncode(item));

    var response = await post(
        Uri.parse('${kApiurl}SYS_USER'),
        headers: headers,
        body: jsonEncode(item)
    );
    print(response.statusCode);
    return response.statusCode;

  }

  static Future<int> PostSYS_NOTIFICATION(List<SYS_NOTIFICATION> items)async{

    var response = await post(
        Uri.parse('${kApiurl}SYS_NOTIFICATION'),
        headers: headers,
        body: jsonEncode(items)
    );
    return response.statusCode;
  }

  static Future<List<GP_SYS_SHIFT>> getGP_SYS_SHIFT() async
  {

    Response res = await get(Uri.parse(kApiurl +'GP_SYS_SHIFT'),headers: headers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);


      //List jsonResponse = json.decode(res.body);
      List<GP_SYS_SHIFT> list = body.map((dynamic item) => GP_SYS_SHIFT.fromJson(item))
          .toList();

      return list;
    } else {
      print('cannot connect');
      throw('Error');
    }
  }

  static Future<String> getAvata(String EMP_ID) async
  {
    var  res= await get(Uri.parse('${kApiurl}Upload/ImageAPI/GetFiles?EMP_ID=${EMP_ID}'),headers: headers);
     String? _base64;
    if (res.statusCode == 200)
      {
        _base64 = res.body.substring(1);
       _base64 = _base64.substring(0,_base64.length-1);


      //  _base64 = res.body.substring(1)!.substring(0,_base64!.length-1);
        return _base64;
      }else
        {
          print('cannot connect');
          throw('Error');
        }
  }
  static Future<LocationModel> getLocation()async
  {
    const _url = 'https://geolocation-db.com/json/';
    final resp = await get(Uri.parse(_url),headers: headers);
    if (resp.statusCode == 200)
      {
        final _data = LocationModel.fromJson(json.decode(resp.body));
        return _data;
      }
    else
    {
      print('cannot connect');
      throw('Error');
    }

  }

}