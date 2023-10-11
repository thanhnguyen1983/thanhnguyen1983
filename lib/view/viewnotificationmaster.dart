import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanweb/state/sys_notificationcontroller.dart';
import 'package:get/get.dart';
import 'package:humanweb/utilities/utility.dart';
class ViewNotificationMaster extends StatefulWidget
{
  @override
  _ViewNotificationMasterState createState()=> _ViewNotificationMasterState();
}
class _ViewNotificationMasterState extends State<ViewNotificationMaster>
{
  Sys_NotificationController sys_notificationController=Get.put(Sys_NotificationController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(()=>
       ListView.builder(
          itemCount: sys_notificationController.items.length,
          itemBuilder: (BuildContext context,int index){
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(2),
                child: Stack(
                  children: <Widget>[Container(
                    height: 60,
                    color: Colors.blue[50],
                    child: ListTile(
                      leading:const Icon(Icons.list),
                      title: Text(sys_notificationController.items[index].TIT_DR!,textScaleFactor: 1.2,),
                      trailing:const Icon(Icons.done),
                        subtitle: Text(sys_notificationController.items[index].DES_DR!,maxLines: 1,),
                      selected: true,
                      onTap: (){
                        _showCupertinoDialog(sys_notificationController.items[index].TIT_DR!,sys_notificationController.items[index].DES_DR!);
                      },
                    ),
                  ),
                    Positioned(right: 5,top: 5,child: Text(Utility.datetoStringFormat(DateTime.parse(sys_notificationController.items[index].SEQ_DT!.substring(0,10).replaceAll('/', '-')), 'dd/MM')))
                  ],
                ),
                ),

              ],
            );
          }));
  }
  _dismissDialog() {
    Navigator.pop(context);
  }
  void _showCupertinoDialog(String title,String des) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(des),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Đóng')),

            ],
          );
        });
  }
}
