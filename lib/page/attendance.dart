import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanweb/api/apiservice.dart';

import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:get/get.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:humanweb/widget/searchorder.dart';
import 'package:network_info_plus_web/network_info_plus_web.dart';


//import 'package:geolocator/geolocator.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


class Attendance extends StatefulWidget
{
  @override
  _AttendanceState createState()=> _AttendanceState();
}
  class _AttendanceState extends State<Attendance>
{
  Filc01aController filc01aController=Get.find();
  Filb01aController filb01aController=Get.find();
  DateRangeDate dateRangeDate=Get.find();
  StatusCodeController statusCodeController=Get.find();


   String? _currentAddress='1';
  double? _latitude = 0.0;
  double? _longitude = 0.0;
  String _city = '';


  @override
   initState()  {

    super.initState();

  }


  // _getCurrentLocation()async
  // {
  //
  //   _latitude = 0.0;
  //   _longitude = 0.0;
  //   final Location location =  Location();
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //
  //   _latitude=_locationData.latitude;
  //   _longitude=_locationData.longitude;
  // }




  void submitAttendance(BuildContext context)async
  {

   var loc=await ApiService.getLocation();
   // await _getCurrentLocation();

   // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   //  if(kIsWeb)
   //  {
   //    messageAllert(
   //        context, 'web $kIsWeb', 'Warning');
   //  }
   //  else {
   //    if (Platform.isAndroid) {
   //      messageAllert(
   //          context, 'Platform.isAndroid $kIsWeb', 'Warning');
   //    }
   //    else if (Platform.isIOS) {
   //      messageAllert(
   //          context, 'Platform.isIOS $kIsWeb', 'Warning');
   //    }
   //  }


    try {
      // var lati=0.0, loti=0.0;
      // print('await _getCurrentLocation()');
        print('print await NetworkInfo getWifiBSSID');

      ///////////////////
      // var wifiBSSID = await (NetworkInfoPlusPlugin().getWifiBSSID());
      //   print('print await NetworkInfoPlusPlugin().getWifiIP()');
      // var wifiIP = await (NetworkInfoPlusPlugin().getWifiIP());//network
      //   print('print await NetworkInfoPlusPlugin().getWifiName()');
      // var wifiName = await (NetworkInfoPlusPlugin().getWifiName());//wifi network
      //
      //
      // print('wifiBSSID $wifiBSSID');
      // print('wifiIP $wifiIP');
      // print('wifiName $wifiName');
      //
      //
      // messageAllert(
      //     context, 'wifiBSSID $wifiBSSID, wifiIP $wifiIP, wifiName $wifiName', 'Warning');

      //////////////////



      // if(filb01aController.items[0].GPS_FG!) {
      //   DialogBuilder(context).showLoadingIndicator('Waiting...');
      //   await _getCurrentLocation();
      //   DialogBuilder(context).hideOpenDialog();
      //   lati = _currentPosition!.latitude;
      //   loti = _currentPosition!.longitude;
      // }
        _latitude=loc.latitude;
        _longitude=loc.longitude;


      print('await ApiService.getFILC01A');
     var list=await ApiService.getFILC01A(filb01aController.items[0].EMP_ID!,
          Utility.datetoStringFormat(DateTime.now(), 'yyyy/MM/dd'), "0", _latitude!,
          _longitude!, _currentAddress!,'','' ,'');


          filc01aController.setAllItem(list);
      dateRangeDate.dtFrom.value=Utility.datetoStringFormat(DateTime.now(), 'yyyy/MM/dd');
      dateRangeDate.dtUntil.value=Utility.datetoStringFormat(DateTime.now(), 'yyyy/MM/dd');

      print('statusCodeController messenge');
      if (statusCodeController.statuscode.value!=200) {
        messageAllert(
            context, statusCodeController.messenge.value.toString(), 'Warning');
      }

    }
    catch(ex)
    {
      //DialogBuilder(context).hideOpenDialog();
    }




   // statusCodeController.initStatusCode();

  }

  @override
   build(BuildContext context)  {
    // TODO: implement build
    var screenWidth = MediaQuery.of(context).size.width;



   // print('${daterangedate.dtFrom} - ${daterangedate.dtUntil} ');
    return SafeArea(
      child: Container(

        child: Column(
          children: <Widget>[
            Container(
              margin:const  EdgeInsets.all(5),
              alignment: Alignment.center,
              width: screenWidth,
              height: 40,
              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(10)),
              child: Obx(()=>Text('${dateRangeDate.dtFrom} - ${dateRangeDate.dtUntil}',style:const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))),
            ),
            Expanded(child: Container(
              child: Obx(() =>
                filc01aController.isLoading.isTrue?
                const Center(child:  CircularProgressIndicator()):
                 ListView.builder(
                  itemCount:filc01aController.items.isEmpty? 0:  filc01aController.items.length,
                  itemBuilder: (context,index){
                    return _buildProductItem(context,index);
                  })),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: bottonView(context)
              ,),
            )
          ],
        ),
      ),
    );
  }


  List<Widget> bottonView(BuildContext context)
  {
    List<Widget>? list=[];

    list.add(InkWell(onTap: (){
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(20.0))),
          backgroundColor: Colors.grey[300],
          context:context,
          isScrollControlled: true,
          builder: (context)  { return SearchOrder();}
      );
    },child: const Icon(Icons.search,size: 32,)));
    if(filb01aController.items[0].WIF_FG==true ||filb01aController.items[0].GPS_FG==true )
    {
      list.add(InkWell(onTap: (){
        submitAttendance(context);
      },child: const Icon(Icons.fingerprint,size: 32,)));
    }
    return list;
  }
 Widget _buildProductItem(BuildContext context, int index) {
   return Card(

     child: Container(
      padding: const EdgeInsets.all(5),
       decoration: BoxDecoration(color: Colors.grey[400],borderRadius:BorderRadius.circular(10)),

       child: Row(
         
         children: <Widget>[
           Expanded(
               child: Row(
                 
                 children: <Widget>[
                   // Icon(listfilc01a[index].STR_DR==0 ? Icons.fingerprint :(listfilc01a[index].STR_DR==1 ? Icons.network_wifi :Icons.add_location  )),
                   Title(color: Colors.red, child: Text(filc01aController.items[index].CRD_DT!, style: const TextStyle(fontSize: 18,color: Colors.black))),
                   const SizedBox(width: 40,),
                   Text(filc01aController.items[index].CRD_TM!, style: const TextStyle(fontSize: 18,color: Colors.black))
                 ],
               )
           ),
           Container(width: 60,color: Colors.transparent,
             child: Icon(filc01aController.items[index].STR_DR==0 ? Icons.fingerprint :(filc01aController.items[index].STR_DR==1 ? Icons.network_wifi :Icons.add_location  )),
           ),
         ],
       ),
     ),
   );
 }


  messageAllert(BuildContext context,String msg, String ttl) {
    if(ttl!="Warning") {
     Get.back();
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(ttl),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: [
                    Text(LanguageService.OK),
                  ],
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }

}

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator( String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))
              ),
              backgroundColor: Colors.transparent,
              content: LoadingIndicator(
                  text: text
              ),
            )
        );
      },
    );
  }

  void hideOpenDialog() {
    Get.back();
  }
}
class LoadingIndicator extends StatelessWidget{
  LoadingIndicator({this.text = ''});

  final String text;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
        padding:const  EdgeInsets.all(3),
        color: Colors.transparent,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              _getText(displayedText)
            ]
        )
    );
  }

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: const CircularProgressIndicator(
                strokeWidth: 3
            ),
            width: 32,
            height: 32
        ),
        padding:const EdgeInsets.only(bottom: 16)
    );
  }

  Widget _getHeading(context) {
    return
     const  Padding(
          child: Text(
            'Please wait …',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.only(bottom: 4)
      );
  }

  Text _getText(String displayedText) {
    return  Text(
      displayedText,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 14
      ),
      textAlign: TextAlign.center,
    );
  }
}