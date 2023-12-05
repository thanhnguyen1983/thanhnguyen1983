import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humanweb/components/classapprovalcacation.dart';
import 'package:humanweb/state/filc04aacontroller.dart';
import 'package:get/get.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';



import '../api/apiservice.dart';
import '../state/fila15acontroller.dart';
import '../state/statuscodecontroller.dart';
import '../state/systemcontroller.dart';
import '../utilities/basealertdialog.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';
class ViewVacationApproval extends StatefulWidget
{
  @override
  _ViewVacationApproval createState()=> _ViewVacationApproval();
}
class  _ViewVacationApproval extends State<ViewVacationApproval>
{
  SystemController systemController=Get.find();
  Filc04aaController filc04aaController=Get.find();
  Fila15aController fila15aController=Get.find();
  var currentIndex=0;
  bool _firstshow=true;
  DateTime selectedDate = DateTime.now();


  bool isCheck=false;
  @override
  initState() {
    super.initState();
  //  fetchData();
   // filc04aaController.fetchProducts(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '2');///chua duyet
  }
  void fetchData() async {
    filc04aaController.fetchProducts(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '1');///chua duyet
  // filc04aaController.fetchProductsAll(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '2');
    print('fetchData');
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.MNU_02),
        actions: [IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.search)),
          currentIndex==0? IconButton(onPressed: (){
            isCheck=!isCheck;
            filc04aaController.changebyCheck(isCheck);
          }, icon: const Icon(Icons.checklist)):Container()

        ],
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios), onPressed: () => Get.back(),
        ),
      ),
      body: currentIndex==0 ? buildListView(context) :buildListView1(context) ,
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
            if(currentIndex==1)
              {
                 filc04aaController.fetchProductsAll(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '2');////da duyet
              }
            else
              {
                filc04aaController.fetchProducts(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '1');///chua duyet
              }
          });

        }
        ,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon:const Icon(Icons.list), label:LanguageService.APV_N1, backgroundColor: Colors.blueAccent,),
          BottomNavigationBarItem(icon:const Icon(Icons.list), label:LanguageService.APV_N2, backgroundColor: Colors.blueAccent,),
        ],
      ),
      floatingActionButton:currentIndex==0? FloatingActionButton(onPressed: (){
        SmartDialog.show(builder: (_){
          return Container(height: 80,width: 330,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
            child: Padding(padding: const EdgeInsets.all(5),
              child: Column(children: [

                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    contentBoxYesorNo(
                        context)
                  ],))
              ],),),);
        });

      },child: const Icon(Icons.check),):Container(),
    );
  }

  Future<void> _selectDate(BuildContext context) async {




    final DateTime? pickedDate = await showMonthPicker(
      //  locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(()  {
        selectedDate = pickedDate;
        _firstshow=false;

        filc04aaController.fetchProductsAll(systemController.username.value, Utility.datetoStringFormat(selectedDate, 'yyyyMM'), '2');
        //changePDF(1);


      });
    }
  }
  Padding buildListView(BuildContext context)
  {
    print('buildListView');
    return  Padding(
      padding: const EdgeInsets.all(5),
      child:Obx(()=> filc04aaController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()): ListView.builder(itemCount: filc04aaController.items.isEmpty ?0: filc04aaController.items.length, itemBuilder: (context,index) =>  itemBuild(context,index))
      ),
    );
  }
  Padding buildListView1(BuildContext context)
  {
    print('buildListView1');
    return  Padding(
      padding: const EdgeInsets.all(5),
      child:Obx(()=> filc04aaController.isLoadingAll.isTrue ? const Center(child: CircularProgressIndicator()): ListView.builder(itemCount: filc04aaController.itemsAll.length, itemBuilder: (context,index) =>  itemBuild1(context,index))
      ),
    );
  }


  /*itemBuildold(BuildContext context,int index)
  {


    return InkWell(
      onTap: () async {
       *//* BaseAlertDialog alert =BaseAlertDialog(title: filc04aaController.items[index].EMP_NM!, content: LanguageService.AppvovalVacation, yesOnPressed:() async {

          int STY=1;
          if(systemController.username.toString()==filc04aaController.items[index].REF_ID)
            STY=1;
          if(systemController.username.toString()==filc04aaController.items[index].REF_I2)
            STY=2;
          if(systemController.username.toString()==filc04aaController.items[index].REF_I3)
            STY=3;
          await ApiService.approvalvacation(filc04aaController.items[index].SEQ_NO!,STY,1,0,systemController.username.toString());

         /// await ApiService.approvalvacation(filc04aaController.items[index].SEQ_NO!,1,0);

          Navigator.of(context).pop();
          filc04aaController.removeItem(index);

        }, noOnPressed: () async {

          int STY=1;
          if(systemController.username.toString()==filc04aaController.items[index].REF_ID)
            STY=1;
          if(systemController.username.toString()==filc04aaController.items[index].REF_I2)
            STY=2;
          if(systemController.username.toString()==filc04aaController.items[index].REF_I3)
            STY=3;
          await ApiService.approvalvacation(filc04aaController.items[index].SEQ_NO!,STY,0,1,systemController.username.toString());

          Navigator.of(context).pop();
          filc04aaController.removeItem(index);
        },);
        showDialog(context: context,builder: (BuildContext context) {
          return alert;
        }
        );*//*

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
                        width: MediaQuery.of(context).size.width/3*2 -50,
                        decoration:const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),

                        child: Title(color: Colors.redAccent, child: Row(children: [Checkbox(value: filc04aaController.items[index].APV_FG, onChanged: (bool? value){
                         // filc04aaController.items[index].APV_FG=value!;
                        }),Text('${filc04aaController.items[index].EMP_NM}')],))
                    ),
                    const Spacer(),
                    Container(
                      //margin: EdgeInsets.all(5),
                        padding:const EdgeInsets.all(3),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width/3,
                        decoration:  BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),

                        child: Title(color: Colors.redAccent, child: Text('${LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aaController.items[index].LEA_ID!).LEA_VN!:fila15aController.findItem(filc04aaController.items[index].LEA_ID!).LEA_CH!}, ${LanguageService.Hour}:${Utility.numbertoStringFormat(filc04aaController.items[index].DAY_TT!* 8 , '#,##0.####') }'))
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${LanguageService.STR_DT}:${filc04aaController.items[index].STR_DT}'),
                    //   Text(LanguageService.To),
                    Text('${LanguageService.END_DT}:${filc04aaController.items[index].END_DT}'),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.items[index].STR_TM!) }'),
                    Text(LanguageService.To),
                    Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.items[index].END_TM!) }'),
                  ],)
              ],
            ),
          )),
    );
  }*/
itemBuild(BuildContext context,int index)
{

  /*if (itemIndex.isOdd) {
    return Divider(); // Add a divider between items
  }
  final index =itemIndex  ~/ 2;
*/
  return CheckboxListTile(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text('${filc04aaController.items[index].EMP_NM}'),
        Container(
          //margin: EdgeInsets.all(5),
            padding:const EdgeInsets.all(3),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width/3,
            decoration:  BoxDecoration(
                color: Colors.teal[300],
                borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
            ),

            child: Title(color: Colors.redAccent, child: Text('${LanguageService.defaultLanguage=='vn'?fila15aController.findItem(filc04aaController.items[index].LEA_ID!).LEA_VN!:fila15aController.findItem(filc04aaController.items[index].LEA_ID!).LEA_CH!}, ${LanguageService.Hour}:${Utility.numbertoStringFormat(filc04aaController.items[index].DAY_TT!* 8 , '#,##0.####') }'))
        )
      ],),
      subtitle: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${LanguageService.STR_DT}:${filc04aaController.items[index].STR_DT}'),
            //   Text(LanguageService.To),
            Text('${LanguageService.END_DT}:${filc04aaController.items[index].END_DT}'),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.items[index].STR_TM!) }'),
            Text(LanguageService.To),
            Text('${LanguageService.Hour}:${Utility.numbertoStringHour(filc04aaController.items[index].END_TM!) }'),

          ],),
        SizedBox(height: 2,child: Container(height: 2,color: Colors.blueAccent,),)

      ],),
      value: filc04aaController.items[index].MEA_BT, onChanged: (value){
    setState(() {
      filc04aaController.items[index].MEA_BT=value!;
    });
  });
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
                            child:Center(child: Title(color: Colors.redAccent, child: Text(filc04aaController.itemsAll[index].DIS_FG==true?'No':'Yes' )),) ,
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
                  ],)
              ],
            ),
          )),
    );
  }

  contentBoxYesorNo(context)
  {
    return CustomRadioButton(
        height: 40,
        width: 150,
        enableShape: true,
        spacing: 1,
        // horizontal: true,
        selectedColor: Theme.of(context).colorScheme.secondary,
      enableButtonWrap: true,
      elevation: 5,
      absoluteZeroSpacing: false,
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables: [LanguageService.vacationno,LanguageService.vacationyes],
      buttonValues:[0,1],
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.black,
          textStyle: TextStyle(fontSize: 14)),
        radioButtonValue: (value) async {
          List<ClassApproval> list=[];
          if (value == 0) {

            for(int i=0;i<filc04aaController.items.length;i++)
              {
                if(filc04aaController.items[i].MEA_BT==true) {
                  int STY = 1;
                  if (systemController.username.toString() ==
                      filc04aaController.items[i].REF_ID)
                    STY = 1;
                  if (systemController.username.toString() ==
                      filc04aaController.items[i].REF_I2)
                    STY = 2;
                  if (systemController.username.toString() ==
                      filc04aaController.items[i].REF_I3)
                    STY = 3;

                  ClassApproval classApproval = ClassApproval(
                      SEQ_NO: filc04aaController.items[i].SEQ_NO!,
                      STY: STY,
                      APV_FG: 0,
                      DIS_FG: 1,
                      EMP_ID: systemController.username.toString());
                  list.add(classApproval);
                }

              }


          }
          if (value == 1) {

            for(int i=0;i<filc04aaController.items.length;i++)
            {
              if(filc04aaController.items[i].MEA_BT==true) {
                int STY = 1;
                if (systemController.username.toString() ==
                    filc04aaController.items[i].REF_ID)
                  STY = 1;
                if (systemController.username.toString() ==
                    filc04aaController.items[i].REF_I2)
                  STY = 2;
                if (systemController.username.toString() ==
                    filc04aaController.items[i].REF_I3)
                  STY = 3;

                ClassApproval classApproval = ClassApproval(
                    SEQ_NO: filc04aaController.items[i].SEQ_NO!,
                    STY: STY,
                    APV_FG: 1,
                    DIS_FG: 0,
                    EMP_ID: systemController.username.toString());
                list.add(classApproval);
              }

            }

          }

          await ApiService.approvalvacationlist(list);
         // if (value == 1) {
            filc04aaController.fetchProducts(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '1');///chua duyet
         // } else {
            filc04aaController.fetchProductsAll(systemController.username.value, Utility.datetoStringFormat(DateTime.now(),'yyyyMM'), '2');////da duyet
         // }

          SmartDialog.dismiss();
        }
    );
  }
}