import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:humanweb/page/login_screen.dart';
import 'package:humanweb/page/myhomepage.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
void main()  {
 // await GetStorage.init();

  runApp( MyApp());
}

class MyApp extends StatefulWidget
{
  @override
  _MyApp createState()=>_MyApp();
}


class _MyApp extends State<MyApp> {

  // This widget is the root of your application.

  bool is_Login=false;
  @override
  initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    checkLoginStatus();
  }

checkLoginStatus()
  {
    StatusCodeController  statusCodeController=Get.put(StatusCodeController());
    DateRangeDate dateRangeDate=Get.put(DateRangeDate());
    Filb01aController filb01aController=Get.put(Filb01aController());
    SystemController systemController=Get.put(SystemController());

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    return GetMaterialApp(
      title: 'Humanresouce Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  is_Login==true?MyHomePage():const LoginScreen(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}


