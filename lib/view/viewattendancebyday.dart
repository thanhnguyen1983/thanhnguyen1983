import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc06acontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';

import 'package:humanweb/utilities/utility.dart';
import 'package:humanweb/view/viewaatendancebydaydetail.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

import 'ViewAttendanceDetailNew.dart';


class ViewAttendanceByDay extends StatefulWidget
{
 @override
 _ViewAttendanceByDayState createState()=>_ViewAttendanceByDayState();
 
}
class _ViewAttendanceByDayState extends State<ViewAttendanceByDay>
{
  DateTime selectedDate = DateTime.now();
  Filc06aController filc06aController=Get.find();
  Filb01aController filb01aController=Get.find();
  @override
  Widget build(BuildContext context) {
    if(filc06aController.items.isNotEmpty)
    {
      selectedDate=DateTime.parse(filc06aController.items[0].ATT_DT?.replaceAll('/', '-')??'');
    }
    
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title:  Text(LanguageService.MNU_04),
          leading:IconButton(onPressed: (){Get.back();},icon:const Icon(Icons.arrow_back_ios) ),
          actions: [
            IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.search))
          ],
        ),
        body:Column(
            children:<Widget>[
              Container(alignment: Alignment.center,padding: const EdgeInsets.all(2),margin: const EdgeInsets.all(2),decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(10)),height: 27,child:  InkWell(onTap: (){
                _selectDate(context);
              },
                child: Text('${LanguageService.MON_DR}: ${Utility.datetoStringFormat(selectedDate, 'MM/yyyy')}'),
              ),),
              Expanded(
                  child:Obx(()=>  ListView.builder(

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: filc06aController.items.length,
                      itemBuilder: (context,index){

                        return itembuild(index);


                      }),

                  )
              ),
            ])
    );
  }


  itembuild(int index)
  {
   

    var thu= DateFormat('EEEE').format(DateTime.parse(filc06aController.items[index].ATT_DT!.replaceAll('/', '-')));
    String SHI_ID=filc06aController.items[index].SHI_ID!;
    // print('$thu');
    if (SHI_ID=='00'|| SHI_ID=='') {

      if(thu=='Sunday')
      {
        return Container(
          margin:const  EdgeInsets.all(2),
          decoration: BoxDecoration(color:Colors.redAccent,borderRadius: BorderRadius.circular(5)),
          height: 30,
          child: Row(
            children: [
              Container(margin:const EdgeInsets.only(left: 2),alignment: Alignment.center,height: 23,width: 23,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(10)), child: Text('${index +1 }'),),
              Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: const Text('Sunday'),),
            ],
          ),
        );
      }else
      {
        return Container(
          margin:const  EdgeInsets.all(2),
          decoration: BoxDecoration(color:Colors.grey[400],borderRadius: BorderRadius.circular(5)),
          height: 30,
          child: Row(
            children: [
              Container(margin:const EdgeInsets.only(left: 2),alignment: Alignment.center,height: 23,width: 23,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(10)), child: Text('${index +1 }'),),
              Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text(SHI_ID==''?LanguageService.Noshift:LanguageService.Dayoff),),
            ],
          ),
        );
      }

      return Container(color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text('${index+1} Khong Lam'),);


    } else {
      return InkWell(
        onTap: (){

          Get.to(()=>ViewAttendanceDetailNew(filc06a: filc06aController.items[index]));
          //Get.to(()=>ViewAttendanceDetail(index: index));
        },
        child: Container(
          margin:const  EdgeInsets.all(2),
          decoration: BoxDecoration(color:thu=='Sunday'?  Colors.redAccent:Colors.grey[400],borderRadius: BorderRadius.circular(5)),
          height: 30,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin:const EdgeInsets.only(left: 2),alignment: Alignment.center,height: 23,width: 23,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(10)), child: Text('${index +1 }'),),
               Expanded(
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text('${LanguageService.ONN_TM}:${Utility.numbertoStringHour(filc06aController.items[index].ONN_01!) } '),),
                  Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text('${LanguageService.OFF_TM}:${Utility.numbertoStringHour(filc06aController.items[index].OFF_01!) } '),),
                  Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text('${LanguageService.ONN_TM}:${Utility.numbertoStringHour(filc06aController.items[index].ONN_02!) } '),),
                  Container(margin:const EdgeInsets.only(left: 5),color: thu=='Sunday' ? Colors.red:Colors.transparent,child: Text('${LanguageService.OFF_TM}:${Utility.numbertoStringHour(filc06aController.items[index].OFF_02!) } '),),
              ],),
               )
                     ],
          ),
        ),
      );
    }
  }

  // detailitem(String SHI_ID)
  // {
  //   return ListView.builder(
  //       itemCount: filc02bController.findItem(SHI_ID).length,
  //       itemBuilder:(context,index){
  //         return Row(children: [
  //           Text('${filc02bController.findItem(SHI_ID)[index].ONN_TM!}'),
  //           Text('-'),
  //           Text('${filc02bController.findItem(SHI_ID)[index].OFF_TM!}'),
  //         ],);
  //       });
  // }
  // String returnShift(String COL_NM)
  // {
  //   var value='';
  //
  //   switch(COL_NM)
  //   {
  //     case "DAY_01":
  //       value=filc03aController.items[0].DAY_01!;
  //       break;
  //     case "DAY_02":
  //       value=filc03aController.items[0].DAY_02!;
  //       break;
  //     case "DAY_03":
  //       value=filc03aController.items[0].DAY_03!;
  //       break;
  //     case "DAY_04":
  //       value=filc03aController.items[0].DAY_04!;
  //       break;
  //     case "DAY_05":
  //       value=filc03aController.items[0].DAY_05!;
  //       break;
  //     case "DAY_06":
  //       value=filc03aController.items[0].DAY_06!;
  //       break;
  //     case "DAY_07":
  //       value=filc03aController.items[0].DAY_07!;
  //       break;
  //     case "DAY_08":
  //       value=filc03aController.items[0].DAY_08!;
  //       break;
  //     case "DAY_09":
  //       value=filc03aController.items[0].DAY_09!;
  //       break;
  //     case "DAY_10":
  //       value=filc03aController.items[0].DAY_10!;
  //       break;
  //     case "DAY_11":
  //       value=filc03aController.items[0].DAY_11!;
  //       break;
  //     case "DAY_12":
  //       value=filc03aController.items[0].DAY_12!;
  //       break;
  //     case "DAY_13":
  //       value=filc03aController.items[0].DAY_13!;
  //       break;
  //     case "DAY_14":
  //       value=filc03aController.items[0].DAY_14!;
  //       break;
  //     case "DAY_15":
  //       value=filc03aController.items[0].DAY_15!;
  //       break;
  //     case "DAY_16":
  //       value=filc03aController.items[0].DAY_16!;
  //       break;
  //     case "DAY_17":
  //       value=filc03aController.items[0].DAY_17!;
  //       break;
  //     case "DAY_18":
  //       value=filc03aController.items[0].DAY_18!;
  //       break;
  //     case "DAY_19":
  //       value=filc03aController.items[0].DAY_19!;
  //       break;
  //     case "DAY_20":
  //       value=filc03aController.items[0].DAY_20!;
  //       break;
  //     case "DAY_21":
  //       value=filc03aController.items[0].DAY_21!;
  //       break;
  //     case "DAY_22":
  //       value=filc03aController.items[0].DAY_22!;
  //       break;
  //     case "DAY_23":
  //       value=filc03aController.items[0].DAY_23!;
  //       break;
  //     case "DAY_24":
  //       value=filc03aController.items[0].DAY_24!;
  //       break;
  //     case "DAY_25":
  //       value=filc03aController.items[0].DAY_25!;
  //       break;
  //     case "DAY_26":
  //       value=filc03aController.items[0].DAY_26!;
  //       break;
  //     case "DAY_27":
  //       value=filc03aController.items[0].DAY_27!;
  //       break;
  //     case "DAY_28":
  //       value=filc03aController.items[0].DAY_28!;
  //       break;
  //     case "DAY_29":
  //       value=filc03aController.items[0].DAY_29!;
  //       break;
  //     case "DAY_30":
  //       value=filc03aController.items[0].DAY_30!;
  //       break;
  //     case "DAY_31":
  //       value=filc03aController.items[0].DAY_31!;
  //       break;
  //
  //   }
  //   return  value;
  // }

  Future<void> _selectDate(BuildContext context) async {

    final DateTime? pickedDate = await showMonthPicker(
       // locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;

        filc06aController.isLoading(true);
        filc06aController.fetchFILC06A(filb01aController.items[0].EMP_ID!,'${Utility.datetoStringFormat(selectedDate, 'yyyy/MM')}/01','${Utility.datetoStringFormat(selectedDate, 'yyyy/MM')}/${Utility.dayinMonth(Utility.datetoStringFormat(selectedDate, 'yyyyMM'))}');

      });
    }
  }
  
}