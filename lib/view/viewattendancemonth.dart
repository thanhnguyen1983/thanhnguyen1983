import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/components/filc06aa.dart';
import 'package:humanweb/state/fila15acontroller.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc06aacontroller.dart';
import 'package:humanweb/state/gp_sys_shiftcontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';

import 'package:humanweb/utilities/utility.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';


class ViewAttendanceMonth extends StatefulWidget
{
  @override
  _ViewAttendanceMonthState createState()=>_ViewAttendanceMonthState();
}
class _ViewAttendanceMonthState extends State<ViewAttendanceMonth>
{
  DateTime selectedDate = DateTime.now();
  bool _isfirstshow=true;
  Filc06aaController filc06aaController=Get.find();
   FILC06AA? item;
  Fila15aController fila15aController=Get.find();
  Gp_sys_ShiftController gp_sys_shiftController=Get.find();
  Filb01aController filb01aController=Get.find();
  List<TableRow> tableRows = <TableRow>[const TableRow(children: [Text(''),Text(''),Text(''),Text('')])];
  @override
  Widget build(BuildContext context) {

    if(filc06aaController.items.isNotEmpty)
    {
      selectedDate=Utility.stringYYYYMMDD(filc06aaController.items[0].YYY_MM??'');
    }



    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title:  Text(LanguageService.MNU_05),
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
                  child:Obx(()=>
                  (_isfirstshow==false && filc06aaController.isLoading.isTrue)  ? const Center(child: CircularProgressIndicator()):
                  (
                  filc06aaController.items.isEmpty? Container():
                  Padding
                    (
                    padding:const EdgeInsets.only(left: 3,right: 3),
                    child: SingleChildScrollView(
                      child: Table(

                        columnWidths: const {1: FixedColumnWidth(70),3: FixedColumnWidth(70)},
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: TableBorder.all(),
                        children: returnTB(),
                      ),
                    ),
                  )),
                  )),
            ])
    );
  }

  Future<void> _selectDate(BuildContext context) async {

    final DateTime? pickedDate = await showMonthPicker(
        //locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;


        filc06aaController.fetchFILC06AA(filb01aController.items[0].EMP_ID!,Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
        _isfirstshow=false;
      });
    }
  }

  Widget textNumberLabel({required String label,required String value})
  {
    return Container(padding: const EdgeInsets.all(10),child: Text('$label:$value'));
  }
  Widget textNumber(Object value,String format)
  {
    return Container(alignment: Alignment.center,padding: const EdgeInsets.all(10),child: Text(Utility.numbertoStringFormat(value, format)));
  }
  Widget textLbel(String value)
  {
    return Container(color: Colors.grey[300],padding: const EdgeInsets.all(10),child: Text(value));
  }

  Widget textNumberHour(Object object)
  {
    return Container(alignment: Alignment.center,padding: const EdgeInsets.all(10),child: Text(Utility.numbertoStringHour(object)));
  }
  List<TableRow> returnTB()
  {
    List<TableRow> tableRows = [];

    if(filc06aaController.items.isEmpty) {
      return tableRows;
    }

    tableRows.add(
        TableRow( children:[
          textLbel(LanguageService.ATT_DY),
      textNumber(filc06aaController.items[0].ATT_DY!,'#,##0.####'),
          textLbel(LanguageService.NIG_DY),
      textNumber(filc06aaController.items[0].NIG_DY!,'#,##0.####'),
    ]));
    tableRows.add(
    TableRow( children:[

      textLbel(gp_sys_shiftController.returnField('ATT_HR')!),
    textNumber(filc06aaController.items[0].ATT_HR!,'#,##0.####'),
      textLbel(gp_sys_shiftController.returnField('NIG_HR')!),
    textNumber(filc06aaController.items[0].NIG_HR!,'#,##0.####'),
    ]));
    tableRows.add(
    TableRow( children:[
      textLbel(gp_sys_shiftController.returnField('OTT_HR')!),
    textNumber(filc06aaController.items[0].OTT_HR!,'#,##0.####'),
      textLbel(gp_sys_shiftController.returnField('NIG_OT')!),
    textNumber(filc06aaController.items[0].NIG_OT!,'#,##0.####'),
  ]));
    tableRows.add(
  TableRow( children:[
    textLbel(gp_sys_shiftController.returnField('DOF_HR')!),
  textNumber(filc06aaController.items[0].DOF_HR!,'#,##0.####'),
    textLbel(gp_sys_shiftController.returnField('DON_OT')!),
  textNumber(filc06aaController.items[0].DON_OT!,'#,##0.####'),
  ]));
    tableRows.add(
  TableRow( children:[
    textLbel(gp_sys_shiftController.returnField('DOF_OT')!),
  textNumber(filc06aaController.items[0].DOF_OT!,'#,##0.####'),
    textLbel(gp_sys_shiftController.returnField('DOF_OV')!),
  textNumber(filc06aaController.items[0].DOF_OV!,'#,##0.####'),
  ]));
    tableRows.add(
  TableRow( children:[
    textLbel(gp_sys_shiftController.returnField('HOL_HR')!),
  textNumber(filc06aaController.items[0].HOL_HR!,'#,##0.####'),
    textLbel(gp_sys_shiftController.returnField('HOL_OT')!),
  textNumber(filc06aaController.items[0].HOL_OT!,'#,##0.####'),
  ]));
    tableRows.add(
  TableRow( children:[
    textLbel(LanguageService.LAT_MN),
  textNumber(filc06aaController.items[0].LAT_MN!,'#,##0.####'),
    textLbel(LanguageService.EAR_MN),
  textNumber(filc06aaController.items[0].EAR_MN!,'#,##0.####'),
  ]));
    tableRows.add(
  TableRow( children:[
    textLbel(LanguageService.ABS_MN),
  textNumber(filc06aaController.items[0].ABS_MN!,'#,##0.####'),
    textLbel(LanguageService.FOR_TM),
  textNumber(filc06aaController.items[0].FOR_TM!,'#,##0.####'),
  ]));

    int count=0;

    print ('fila15aController.items.length/2:${fila15aController.items.length/2}');
    print ('fila15aController.items.length%2:${fila15aController.items.length%2}');

    int page=0,index=0;
    if(fila15aController.items.length/2==0) {
      double a=fila15aController.items.length/2 ;
      page=a.toInt();
    } else {
      double a=fila15aController.items.length/2 ;
      page=a.toInt();
      page=page+1;
    }


   for(var i=0;i<page;i++)
     {

       if(index<fila15aController.items.length) {
         var a=returnVacation(filc06aaController.items[0].toJson(),fila15aController.items[index].LEA_ID!);
         var b=index+1 ==fila15aController.items.length ?'0': returnVacation(filc06aaController.items[0].toJson(),fila15aController.items[index+1].LEA_ID!);
        // var b='0.0';
          print('a=$a,b=$b page:$page');
         if(double.parse(a.toString())!=0 || double.parse(b.toString())!=0) {
           print('$a');
           tableRows.add(
               TableRow(children: [
                 textLbel(index >= fila15aController.items.length
                     ? ''
                     : LanguageService.defaultLanguage=='vn'?fila15aController.items[index].LEA_VN!:fila15aController.items[index].LEA_CH!),
                 textNumber(index >= fila15aController.items.length
                     ? '0'
                     : returnVacation(filc06aaController.items[0].toJson(),
                     fila15aController.items[index].LEA_ID!), '#,##0.####'),
                 textLbel(index >= fila15aController.items.length
                     ? ''
                     :  LanguageService.defaultLanguage=='vn'?fila15aController.items[index + 1].LEA_VN!:fila15aController.items[index + 1].LEA_CH!),
                 textNumber(index + 1 >= fila15aController.items.length
                     ? '0'
                     : returnVacation(filc06aaController.items[0].toJson(),
                     fila15aController.items[index + 1].LEA_ID!), '#,##0.####'),
               ]));

         }
         index += 2;
       }
      // getKeysAndValuesUsingForEach(fila15aController.items[index].toJson());
     }

  return tableRows;
  }
  void getKeysAndValuesUsingForEach(Map map) {
    // Get all keys and values at the same time using map.forEach
    print('----------');
    print('Get keys and values using map.forEach:');
    map.forEach((key, value) {
      print('Key = $key : Value = $value');
    });
  }

  double returnVacation(Map map,String LEA_ID)
  {
    var v;
    map.forEach((key, value) {
      if(key=='LEA_$LEA_ID') {
        v=value;
      }
    });
    return v;
  }
  String returnVacationKey(Map map,String LEA_ID)
  {
    var v='';
    map.forEach((key, value) {
      if(key=='LEA_$LEA_ID') {
        v=key;
      }
    });
    return v;
  }
}