//import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
//import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'dart:convert';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/objectvacation.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/state/fila15acontroller.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc04acontroller.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:humanweb/widget/date_range_picker_widget.dart';
import 'package:humanweb/widget/time_picker_widget.dart';

import '../state/filc04aacontroller.dart';

class ViewVacation extends StatefulWidget
{
  @override
  _ViewVacation createState()=> _ViewVacation();
}
class  _ViewVacation extends State<ViewVacation>
{

  var is_Day=true;
  final _formKey = GlobalKey<FormState>();
  StatusCodeController statusCodeController=Get.find();
  Fila15aController fila15aController=Get.find();
  DateRangeDate dateTimeRange=Get.find();
  Filc04aController filc04aController=Get.put(Filc04aController());
  Filb01aController filb01aController=Get.find();
  Filc04aaController filc04aaController=Get.find();
  String? lea_id="",dt1="",dt2="",time1='',time2='';
  var currentIndex=0;

  @override
  initState() {
    super.initState();

    filc04aController.fetchProducts(filb01aController.items[0].EMP_ID!,Utility.datetoStringFormat(DateTime.now(),'yyyy'));
    filc04aaController.fetchProductsAll(filb01aController.items[0].EMP_ID!,Utility.datetoStringFormat(DateTime.now(),'yyyyMM'),'3');
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.MNU_02),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios), onPressed: () => Get.back(),
        ),
      ),
      body: currentIndex==0 ? buildPadding(context): (currentIndex==2 ? buildListView(context):buildListView1(context)),
      bottomNavigationBar:  BottomNavigationBar(
          selectedFontSize: 18,
          iconSize: 20,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
          setState(() {
            currentIndex=index;
            print(currentIndex);
          });
          }
          ,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon:const Icon(Icons.access_alarm), label:LanguageService.MNU_02, backgroundColor: Colors.blueAccent,),
          BottomNavigationBarItem(icon:const Icon(Icons.list), label:LanguageService.APV_N1, backgroundColor: Colors.blueAccent,),
          BottomNavigationBarItem(icon:const Icon(Icons.list), label:LanguageService.APV_N2, backgroundColor: Colors.blueAccent,),
        ],
      ),
    );
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(5),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(child: Column(
          children: <Widget>[
            contentBoxVacation(context),
            contentBoxDayorHour(context),
           SizedBox(height: 10,),
           // const Text('Tu ngay den ngay',style: TextStyle(fontSize: 18),),
            DateRangePickerWidget(),

           // const Text('Tu gio den gio',style: TextStyle(fontSize: 18),),
           is_Day==true? Container():Row( children: [
             Expanded(child: TimePickerWidget(isFrom: '_timefrom',)),
             const SizedBox(width: 8),
             const Icon(Icons.arrow_forward, color: Colors.white),
             const SizedBox(width: 8),
             Expanded(child: TimePickerWidget(isFrom: '_timeuntil')),
           ],),

            Container(

                width:120 ,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topCenter,
                child:OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(width: 2, color: Colors.deepOrangeAccent),
                  ),
                  child: Text(LanguageService.OK),


                  onPressed: ()=>_submit(),
                )
            )
          ],
        )
        ),
      ),
    );
  }

  Padding buildListView(BuildContext context)
  {
  return  Padding(
    padding: const EdgeInsets.all(5),
    child: ListView.builder(
        itemCount: filc04aController.items.length,
        itemBuilder: (context,index) =>  itemBuild(context,index)
    ),
  );
  }


  Padding buildListView1(BuildContext context)
  {
    print('buildListView1');
    return  Padding(
      padding: const EdgeInsets.all(5),
      child:Obx(()=> filc04aaController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()): ListView.builder(itemCount: filc04aaController.itemsAll.length, itemBuilder: (context,index) =>  itemBuild1(context,index))
      ),
    );
  }
  itemBuild1(BuildContext context,int index)
  {
    return InkWell(
      onTap: () async {

      },
      child: Card(
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(color: Colors.grey[300],borderRadius:BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:<Widget>[
                    Container(
                      //margin: EdgeInsets.all(5),
                        padding:const EdgeInsets.all(4),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width/3*2 -60,
                        decoration:const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),

                        child: Title(color: Colors.lightGreenAccent, child: Text('${filc04aaController.itemsAll[index].EMP_NM}'))
                    ),
                    const Spacer(),
                    Container(
                      //margin: EdgeInsets.all(5),
                        padding:const EdgeInsets.all(4),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width/3,
                        decoration:  BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),

                        child: Row(children: <Widget>[Title(color: Colors.redAccent, child: Text('${LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aaController.itemsAll[index].LEA_ID!).LEA_VN!:fila15aController.findItem(filc04aaController.itemsAll[index].LEA_ID!).LEA_CH!}, ${LanguageService.Hour}:${Utility.numbertoStringFormat(filc04aaController.itemsAll[index].DAY_TT!* 8 , '#,##0.####') }')),
                          const Spacer(),
                          Container(
                            width: 25,
                            height: 25,
                            decoration:  BoxDecoration(
                                color: Colors.red[300],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:Center(child: Title(color: Colors.redAccent, child: Text(filc04aaController.itemsAll[index].APV_N1==true?'Yes':'No' )),) ,
                          ),

                        ],)
                    ),


                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${LanguageService.STR_DT}:${filc04aaController.itemsAll[index].STR_DT}'),
                    //   Text(LanguageService.To),
                    Text('${LanguageService.END_DT}:${filc04aaController.itemsAll[index].END_DT}'),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.itemsAll[index].STR_TM!) }'),
                    Text(LanguageService.To),
                    Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.itemsAll[index].END_TM!) }'),
                  ],),

              ],
            ),
          )),
    );
  }

   itemBuild(BuildContext context,int index)
  {
    return InkWell(
      onTap: () async {

       double total=0;
        for(var item in filc04aController.items)
        {
          if(item.LEA_ID==filc04aController.items[index].LEA_ID) {
            total+=item.DAY_TT!;
          }

        }



        var msg=LanguageService.Msgvacation.replaceAll('[total]', '[$total]').replaceAll('[LEA_ID]', '[${LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_VN:fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_CH}]');
       double totalinyear=0;
       double can_qt=0;
       if(filc04aController.items[index].LEA_ID=="001")
       {
         var list=await ApiService.getFILC04B(filb01aController.items[0].EMP_ID!,Utility.datetoStringFormat(DateTime.now(),'yyyy'));
         if(list.isNotEmpty) {
           totalinyear=list[0].HAV_QT! + list[0].SUP_QT! + list[0].BOR_QT! + list[0].ADD_QT! + list[0].LST_QT!;
           can_qt=totalinyear-total;
         }
          msg="${LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_VN:fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_CH}:$totalinyear \n ${LanguageService.DIS_QT}:$total \n ${LanguageService.CAN_QT}:$can_qt";
       }
        messageAllert(msg,LanguageService.Notification);
      },
      child: Card(
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(color: Colors.grey[400],borderRadius:BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:<Widget>[
                    Container(
                    //margin: EdgeInsets.all(5),
                    padding:const EdgeInsets.all(4),
                      alignment: Alignment.centerLeft,
                    width: 100,
                    decoration:const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),

                      child: Title(color: Colors.redAccent, child: Text(LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_VN!:fila15aController.findItem(filc04aController.items[index].LEA_ID!).LEA_CH!))
                  ),
                    const Spacer(),
                    Container(
                      //margin: EdgeInsets.all(5),
                        padding:const EdgeInsets.all(3),
                        alignment: Alignment.centerLeft,
                        width: 60,
                        decoration:  BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),

                        child: Title(color: Colors.redAccent, child: Text('${LanguageService.Hour}:${Utility.numbertoStringFormat(filc04aController.items[index].DAY_TT!* 8 , '#,##0.####') }'))
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text('${LanguageService.STR_DT}:${filc04aController.items[index].STR_DT}'),
                 //   Text(LanguageService.To),
                  Text('${LanguageService.END_DT}:${filc04aController.items[index].END_DT}'),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aController.items[index].STR_TM!) }'),
                  Text(LanguageService.To),
                  Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aController.items[index].END_TM!) }'),

                ],),
                Row(children: [Text('user:${filc04aController.items[index].BLT_NM} ,${filc04aController.items[index].BLT_DT}')],)
              ],
            ),
          )),
    );
  }
  contentBoxVacation(context)
  {
    return CustomRadioButton(

      elevation: 5,
      absoluteZeroSpacing: true,
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables: fila15aController.items.where((element) => element.MOB_FG==true).map((e) => LanguageService.defaultLanguage=='vn'? e.LEA_VN!:e.LEA_CH!).toList(),
      buttonValues: fila15aController.items.where((element) => element.MOB_FG==true) .map((e) => e.LEA_ID!).toList(),
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.black,
          textStyle: TextStyle(fontSize: 14)),
      radioButtonValue: (value) {

        lea_id=value as String?;
      },
      //defaultSelected: widget.controller.itemchoice.value.itemSugar,
     // height: 30,
      enableShape: true,
      spacing: 5,
      selectedColor: Theme.of(context).colorScheme.secondary,
      horizontal: true,
      margin:const EdgeInsets.all(3),
    );
  }

  contentBoxDayorHour(context)
  {
    return CustomRadioButton(

      elevation: 5,
      absoluteZeroSpacing: true,
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables: [LanguageService.HOU_BT,LanguageService.DAY_BT],
      buttonValues: const [0,1],
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.black,
          textStyle: TextStyle(fontSize: 14)),
      radioButtonValue: (value) {

        setState(() {
          if(value==1) {
            is_Day=true;
          }else
            {
              is_Day=false;
            }
        });
       // lea_id=value as String?;
      },
      defaultSelected: 1,
      width: 150,
      height: 40,
      enableShape: true,
      spacing: 5,
      selectedColor: Theme.of(context).colorScheme.secondary,
      //horizontal: true,
      margin:const EdgeInsets.all(3),
    );
  }

  _submit()
  async {
    var ok=true;
    if(lea_id!.isEmpty) {
      ok=false;
      messageAllert(LanguageService.RES_DR, 'Warning');

    }
    if(dateTimeRange.dtFrom.isEmpty || dateTimeRange.dtUntil.isEmpty ) {
      ok=false;
      messageAllert(LanguageService.INP_DT, 'Warning');
    }
     if(is_Day==false && (dateTimeRange.hourForm.isEmpty || dateTimeRange.hourUntil.isEmpty)) {
       ok=false;
       messageAllert(LanguageService.INT_HR, 'Warning');
     }

     if(ok) {


       double STR_TM=0.0;
       double END_TM=0.0;




       var msg='${fila15aController.findItem(lea_id!).LEA_VN!} từ ngày ${dateTimeRange.dtFrom} đến ngày ${dateTimeRange.dtUntil}';
       if(!is_Day) {
         msg+=', từ giờ ${dateTimeRange.hourForm} ,đến giò ${dateTimeRange.hourUntil}';
          STR_TM=double.parse(dateTimeRange.hourForm.value.replaceAll(':', ''));
          END_TM=double.parse(dateTimeRange.hourUntil.value.replaceAll(':', ''));
       }


       ObjectVacation  item=ObjectVacation(EMP_ID: filb01aController.items[0].EMP_ID,STR_DT:dateTimeRange.dtFrom.value,END_DT: dateTimeRange.dtUntil.value,STR_TM:STR_TM,END_TM: END_TM,LEA_ID: lea_id);

       String mess=await ApiService.vacation(item);
       messageAllert(mess, 'Success');
       filc04aController.fetchProducts(filb01aController.items[0].EMP_ID!,Utility.datetoStringFormat(DateTime.now(),'yyyy'));

       dateTimeRange.init();
     }

  }
  messageAllert(String msg, String ttl) {
    if(ttl!="Warning") {
      Navigator.pop(context);
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
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}