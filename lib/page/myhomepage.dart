import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/presentation/character_list_screen.dart';
import 'package:humanweb/state/fila15acontroller.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:humanweb/state/filc03acontroller.dart';
import 'package:humanweb/state/filc06aacontroller.dart';
import 'package:humanweb/state/filc06acontroller.dart';
import 'package:humanweb/state/gp_sys_shiftcontroller.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/state/sys_notificationcontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';

import 'attendance.dart';
import 'bell.dart';
import 'home.dart';
import 'infomation.dart';
import 'logout.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key?key}):super(key:key);





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var currentIndex=2;

  Filb01aController filb01aController=Get.find();
  StatusCodeController  statusCodeController=Get.find();


  Filc01aController filc01aController=Get.put(Filc01aController());
  Fila15aController fila15aController=Get.put(Fila15aController());
  Filc03aController filc03aController=Get.put(Filc03aController());
  Filc06aController filc06aController=Get.put(Filc06aController());
  Filc06aaController filc06aaController=Get.put(Filc06aaController());
  Sys_NotificationController sys_notificationController=Get.put(Sys_NotificationController());
  Gp_sys_ShiftController gp_sys_shiftController=Get.put(Gp_sys_ShiftController());
  SystemController systemController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:   returnMenu(currentIndex),//screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blueAccent,
        backgroundColor: Colors.white,
        onTap: (index){
          setState(() {
            currentIndex=index;
            if(currentIndex==1)
            {
             filc01aController.isLoading(true);
             filc01aController.fetchProducts();
            }
            if(currentIndex==3)
            {


            sys_notificationController.fetchSYS_NOTIFICATION(filb01aController.items[0].EMP_ID!);
            }
          });
        },
        index: currentIndex,
        items:  [
          Icon(Icons.person,color: currentIndex==0 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.fingerprint,color: currentIndex==1 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.home,color: currentIndex==2 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.notification_important,color: currentIndex==3 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.logout,color: currentIndex==4 ? Colors.black:Colors.white,size: 30,),

        ],

      ),
    );
  }

  Widget? returnMenu(int index)
  {

    print('returnMenu $index');
    Widget value;
    switch(index)
    {
      case 0:
        return Infomation();
        break;
      case 1:
        return Attendance();
        break;
      case 2:
        return Obx(() => filb01aController.isLoading.isTrue ?  const Center(child: CircularProgressIndicator(),)  : HomePage());
        break;
      case 3:
        return Notifications();
        break;
      case 4:
        if(systemController.isadmin.isTrue) {

          filc01aController.userInit();
          filc03aController.userInit();

          filc06aController.userInit();
          filc06aaController.userInit();

          Get.back();
          //return Obx(() => filb01aController.isLoading.isTrue ?  const Center(child: CircularProgressIndicator(),)  : HomePage());


        }else {
          return Logout();
        }
        break;


    }
    return Container();

  }

}