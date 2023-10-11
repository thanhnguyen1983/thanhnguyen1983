import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/state/fild02acontroller.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter_html/flutter_html.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/apiservice.dart';
import '../state/filb01acontroller.dart';
import '../state/filc06aacontroller.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';
class ViewAttendanceMonthNew extends StatefulWidget
{
  @override
  _ViewAttendanceMonthNewState createState()=> _ViewAttendanceMonthNewState();
}
class _ViewAttendanceMonthNewState extends State<ViewAttendanceMonthNew>
{
  bool _isLoading = true;
  bool _firstshow = true;
  DateTime selectedDate = DateTime.now();
  Filb01aController filb01aController=Get.find();
  Filc06aaController filc06aaController=Get.find();
  List<dynamic> body=[];

  @override
  void initState() {
    super.initState();
    filc06aaController.fetchFILC06AA(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
    //getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text('${LanguageService.MNU_05} ${Utility.datetoStringFormat(selectedDate, 'MM/yyyy')}') ,
          actions: [
            IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.search))
          ]
      ),
      body:Obx(()=> ( filc06aaController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(padding: const EdgeInsets.all(5),child: Column(children: getList(),),)),
    );

  }

  Future<void> _selectDate(BuildContext context) async {

    print('showMonthPicker');

    final pickedDate = await showMonthPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050)
    );


    /* final  pickedDate = await showMonthPicker(
        locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
*/

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(()  {
        selectedDate = pickedDate;
        _firstshow=false;
        filc06aaController.fetchFILC06AA(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
      });
    }
  }
  List<Widget> getList()
  {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> list=[];
    list.add(createRow2(screenWidth,'NGHỈ PHÉP NĂM 年假 (GIỜ小時）',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_001!, "#,###.#") ));
    list.add(createRow2(screenWidth,'NGHỈ KHÔNG LƯƠNG 無薪假 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_008!, "#,###.#")));
    list.add(createRow2(screenWidth,'NGHỈ VIỆC RIÊNG, 事假 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_007!, "#,###.#")));
    list.add(createRow2(screenWidth,'NGHỈ PHÉP BỆNH 病假 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_002!, "#,###.#")));

    list.add(createRow2(screenWidth,'KHÁM THAI 產檢 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_013!, "#,###.#")));
    list.add(createRow2(screenWidth,'VỢ SINH 陪產假 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_019!, "#,###.#")));
    list.add(createRow2(screenWidth,'DƯỠNG SỨC 休養假 (GIỜ小時)',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_024!, "#,###.#")));

    list.add(createRow2(screenWidth,'NGHỈ KHÔNG PHÉP 曠工  (GIỜ小時）',Utility.numbertoStringFormat(filc06aaController.getitem().LEA_017! + filc06aaController.getitem().ABS_MN!, "#,###.#")));
    list.add(createRow2(screenWidth,'NGHỈ PHÉP TANG 婚假 (GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().LEA_004!), "#,###.#")));
    list.add(createRow2(screenWidth,'KẾT HÔN 喪假 (GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().LEA_003!), "#,###.#")));
    list.add(createRow2(screenWidth,'NGHỈ LỄ 節日時數 (GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().HOL_TT!), "#,###.#")));

    list.add(createRow1(screenWidth, 'NGÀY THƯỜNG 正常日',false));
    list.add(createRow2(screenWidth,'CA NGÀY 正常工時(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().ATT_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA NGÀY 正常加班(GIỜ小時)',Utility.numbertoStringFormat((filc06aaController.getitem().OTT_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'CA ĐÊM 正常夜班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().NIG_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM 夜班加班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().NIG_OT!), "#,###.#")));

    list.add(createRow1(screenWidth, 'CHỦ NHẬT 星期',false));
    list.add(createRow2(screenWidth,'NGÀY CHỦ NHẬT 週日班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().DOF_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA CHỦ NHẬT 週日加班(GIỜ小時)',Utility.numbertoStringFormat((filc06aaController.getitem().DOF_OT!), "#,###.#")));
    list.add(createRow2(screenWidth,'ĐÊM CHỦ NHẬT 星期天晚班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().DON_OT!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM CHỦ NHẬT 週日通宵(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().DOF_OV!), "#,###.#")));

    list.add(createRow1(screenWidth, 'NGÀY LỄ 國定假日',false));
    list.add(createRow2(screenWidth,'CA NGÀY LỄ 節日班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().HOL_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA NGÀY LỄ 節日加班(GIỜ小時)',Utility.numbertoStringFormat((filc06aaController.getitem().HOL_OT!), "#,###.#")));
    list.add(createRow2(screenWidth,'CA ĐÊM LỄ 國定假日晚班(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().HON_HR!), "#,###.#")));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM LỄ 節日通宵(GIỜ小時）',Utility.numbertoStringFormat((filc06aaController.getitem().HOL_OV!), "#,###.#")));
    list.add(createRow1(screenWidth, 'CHUYÊN CẦN 考勤',false));
    list.add(createRow2(screenWidth,'ĐI TRỄ (LẦN蘭）',Utility.numbertoStringFormat((filc06aaController.getitem().LAT_TM!), "#,###.#")));
    list.add(createRow2(screenWidth,'ĐI TRỄ (PHÚT蘭）',Utility.numbertoStringFormat((filc06aaController.getitem().LAT_MN!)*60, "#,###")));
    list.add(createRow2(screenWidth,'VỀ SỚM (LẦN蘭）',Utility.numbertoStringFormat((filc06aaController.getitem().EAR_TM!), "#,###.#")));
    list.add(createRow2(screenWidth,'VỀ SỚM (PHÚT蘭）',Utility.numbertoStringFormat((filc06aaController.getitem().EAR_MN!)*60, "#,###")));



    return list;
  }

  Widget createRow1(double screenWidth,String label,bool borderbotton)
  {
    return Container(
      alignment: Alignment.center,
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
          border: borderbotton==true ? Border.all(color: Colors.blue,width: 2.0):Border(left: BorderSide(color: Colors.blue,width: 2.0),right: BorderSide(color: Colors.blue,width: 2.0),top: BorderSide(color: Colors.blue,width: 2.0))
      ),
      child: Row(children: [

        Expanded(child: Center(child: Text('$label',style: TextStyle(fontWeight: FontWeight.bold),),)),

      ],),

    );
  }

  Widget createRow2(double screenWidth,String label,String value)
  {
    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.blue,width: 2.0),right: BorderSide(color: Colors.blue,width: 2.0),top: BorderSide(color: Colors.blue,width: 2.0))),
      child: Row(children: [
        SizedBox(width: 10,),
        Expanded(child: Text('$label')),
        SizedBox(width: 50,child: Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('$value',style:TextStyle(fontWeight: FontWeight.bold),),),),),
        SizedBox(width: 10,),
      ],),

    );
  }
  Widget createRow3(double screenWidth,int seq,String label,String value,bool bold)
  {
    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.blue,width: 2.0),right: BorderSide(color: Colors.blue,width: 2.0),top: BorderSide(color: Colors.blue,width: 2.0))),
      child: Row(children: [
        SizedBox(width: 40,child: Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('$seq',style:TextStyle(fontWeight: FontWeight.bold),),),),),
        Expanded(child: Text('$label',style: TextStyle(fontWeight: bold==true ?FontWeight.bold:FontWeight.normal),)),
        SizedBox(width: 80,child: Text('$value',textAlign: TextAlign.right,),),
        SizedBox(width: 10,),
      ],),

    );
  }
  Widget createRow3Bold(double screenWidth,int seq,String label,String value,bool bold)
  {
    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.blue,width: 2.0),right: BorderSide(color: Colors.blue,width: 2.0),top: BorderSide(color: Colors.blue,width: 2.0))),
      child: Row(children: [
        SizedBox(width: 40,child: Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('$seq',style:TextStyle(fontWeight: FontWeight.bold),),),),),
        Expanded(child: Text('$label',style: TextStyle(fontWeight: bold==true ?FontWeight.bold:FontWeight.normal),)),
        SizedBox(width: 80,child: Text('$value',textAlign: TextAlign.right,style: TextStyle(fontWeight: bold==true ?FontWeight.bold:FontWeight.normal)),),
        SizedBox(width: 10,),
      ],),

    );
  }

  Widget createRow4(double screenWidth,int seq,String label,String value1,String value2,bool bold)
  {
    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.blue,width: 2.0),right: BorderSide(color: Colors.blue,width: 2.0),top: BorderSide(color: Colors.blue,width: 2.0))),
      child: Row(children: [
        SizedBox(width: 40,child: Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('$seq',style:TextStyle(fontWeight: FontWeight.bold),),),),),
        Expanded(child: Text('$label',style: TextStyle(fontWeight: bold==true ?FontWeight.bold:FontWeight.normal),)),
        SizedBox(width: 40,child: Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('$value1',style:TextStyle(fontWeight: FontWeight.normal),),),),),

        SizedBox(width: 80,child: Text('$value2',textAlign: TextAlign.right,),),
        SizedBox(width: 10,),
      ],),

    );
  }

/*getData()async
    {
      setState(() => _isLoading = true);
      String res=await ApiService.getFILD02A(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));

      print(res);
      List<dynamic> body = jsonDecode(res);

      setState(() => _isLoading = false);
      return body;
    }

    getValueByField(List list,String Field,String format)
    {
      String vl='';

      if(list.isEmpty)
        return '';
      body.forEach((element) {
        element.forEach((key,value)
        {
          if(key==Field)
            {
              vl=Utility.numbertoStringFormat(vl, format);
            }
        }
        );

      });
      return vl;
    }*/

}
