import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:humanweb/state/filc03acontroller.dart';
import 'package:humanweb/state/filc06aacontroller.dart';
import 'package:humanweb/state/filc06acontroller.dart';

import 'package:get/get.dart';
import 'login_screen.dart';

class Logout extends StatelessWidget
{

  @override
  Widget build(BuildContext context)  {
    // TODO: implement build
    initsystem();
    Get.to(()=>const LoginScreen());
    return Container();

  }


  void initsystem() async
  {

   print('initsystem');
    // await SharedPreferencesRepository.init();
    // await SharedPreferencesRepository.putString("EMP_ID", "DEFAULT_VALUE");
    // await SharedPreferencesRepository.putBool("rememberMe", false);
    // await SharedPreferencesRepository.putString("Pass", 'false');


   final storage = GetStorage();

   storage.write('EMP_ID', '');
   storage.write('rememberMe', false);
   storage.write('Pass', 'false');

    DateRangeDate dateRangeDate=Get.find();
    Filb01aController filb01aController=Get.find();
    Filc01aController filc01aController=Get.find();
    Filc03aController filc03aController=Get.find();
    Filc06aController filc06aController=Get.find();
    Filc06aaController filc06aaController=Get.find();

    dateRangeDate.init();
    filb01aController.items.clear();
    filc01aController.items.clear();
    filc03aController.items.clear();
    filc06aController.items.clear();
    filc06aaController.items.clear();
  }
}