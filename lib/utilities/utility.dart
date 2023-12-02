import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:encrypt/encrypt.dart' as MH;
class Utility{

  static String numberFormat(int num)
  {
    var f = NumberFormat("#,###", "en_US");
    return f.format(num);
  }

  static String numbertoStringFormat(Object num,String format)
  {


    var f = NumberFormat(format, "en_US");

    var temp=double.parse(num.toString());
    if(temp==0) {
      return '';
    }

    return f.format(num);
  }
  static String numbertoStringHour(Object num)
  {

    var value=  num.toString().split('.');
   if(value[0].length==1) {
     if(value[0]=='0')
       return '';
     return '0:0${value[0]}';
   }
    if(value[0].length==2) {
      return '0:${value[0]}';
    }
    if(value[0].length==3) {
      return '${value[0].substring(0,1)}:${value[0].substring(1,3)}';
    }
    if(value[0].length==4) {
      return '${value[0].substring(0,2)}:${value[0].substring(2,4)}';
    }
    return '';

  }

  static String datetoStringFormat(DateTime dateTime,String format)
  {

    return DateFormat(format).format(dateTime);
  }

  static int dayinMonth(String YYYMM)
  {
    var day=0;
    if(YYYMM=='') {
      day=daysInMonth(DateTime.now().year,DateTime.now().month);
    } else {

     // print('YYYY ${YYYMM.substring(0,4)} MM ${YYYMM.substring(4)}');

      day= daysInMonth(int.parse(YYYMM.substring(0,4)),int.parse(YYYMM.substring(4)));
    }

   // print('dayinMonth $YYYMM $day');
   return day;


  }

  static String stringMMYYYY(String yyyymm)
  {
    if(yyyymm=='')
    {
      return "";
    }else
      {

        return '${yyyymm.substring(4)}/${yyyymm.substring(0,4)}';
      }

  }
  static DateTime stringYYYYMMDD(String yyyymm)
  {
    if(yyyymm=='')
    {
      return DateTime.now();
    }else
    {

      return  DateTime.parse('${yyyymm.substring(0,4)}-${yyyymm.substring(4)}-01'); //'${yyyymm.substring(0,4)}/${yyyymm.substring(4)}/01';
    }

  }

  static showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


 /* static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }*/

  static String encryptString(String data)
  {

    String keySTR = "0102030405060708"; //16 byte
    String ivSTR = "1020304050607080"; //16 byte


    final plainText = data;

    final key = MH.Key.fromUtf8(keySTR);
    final iv = MH.IV.fromUtf8(ivSTR);
    final encrypter = MH.Encrypter(MH.AES(key,mode: MH.AESMode.cbc,padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    //final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return encrypted.base64;
  }

  static String sqlSQL(String sql)
  {
    if(sql.isEmpty)
      return "";
    return sql.replaceAll('\'', '\'\'');
  }
}