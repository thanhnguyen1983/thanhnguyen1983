import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/state/fild02acontroller.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';
import 'package:quiver/check.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter_html/flutter_html.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/apiservice.dart';
import '../components/filc06a.dart';
import '../state/filb01acontroller.dart';
import '../state/filc06aacontroller.dart';
import '../state/filc06acontroller.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';
class ViewAttendanceDetailNew extends StatefulWidget
{

  FILC06A filc06a;
  ViewAttendanceDetailNew({Key?key,required this.filc06a}):super(key: key);
  @override
  _ViewAttendanceDetailNewState createState()=> _ViewAttendanceDetailNewState();
}
class _ViewAttendanceDetailNewState extends State<ViewAttendanceDetailNew>
{

  List<dynamic> body=[];

  @override
  void initState() {
    super.initState();
  //  filc06aController.fetchFILC06A(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
    //getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text('${LanguageService.MNU_04} ${Utility.datetoStringFormat(DateTime.parse(widget.filc06a.ATT_DT!), 'dd/MM/yyyy')}') ,

      ),
      body: SingleChildScrollView(padding: const EdgeInsets.all(5),child: Column(children: getList(),),)
    );

  }





  Widget getVacation(String LEA_ID,String LEA_H1,screenWidth)
  {
    String LEA_VN="";
    switch(LEA_ID)
    {
      case "001":
        LEA_VN="NGHỈ PHÉP NĂM 年假 (GIỜ小時）";
        break;
      case "008":
        LEA_VN="NGHỈ KL 無薪假 (GIỜ小時)";
        break;
      case "007":
        LEA_VN="NGHỈ VR, 事假 (GIỜ小時)";
        break;
      case "002":
        LEA_VN="NGHỈ PB 病假 (GIỜ小時)";
        break;
      case "013":
        LEA_VN="KHÁM THAI 產檢 (GIỜ小時)";
        break;
      case "019":

        LEA_VN="VỢ SINH 陪產假 (GIỜ小時)";
        break;
      case "024":
        LEA_VN="DƯỠNG SỨC 休養假 (GIỜ小時)";

        break;
      case "017":
        LEA_VN="NGHỈ KHÔNG PHÉP 曠工  (GIỜ小時）";
        break;
      case "004":
        LEA_VN="NGHỈ PHÉP TANG 婚假 (GIỜ小時）";
        break;
      case "003":
        LEA_VN="KẾT HÔN 喪假 (GIỜ小時）";
        break;
      case "HOL_TT":
        LEA_VN="NGHỈ LỄ 節日時數 (GIỜ小時)";
        break;
    default:
      LEA_VN="";
      break;
    }
    
    if(LEA_H1=="LEA_H1") {
      return createRow2(screenWidth,LEA_VN,Utility.numbertoStringHour(widget.filc06a.LEA_H1!) );
    }
    else if(LEA_H1=="ABS_MN"){
      LEA_VN="NGHỈ KHÔNG PHÉP 曠工  (GIỜ小時）";
      return createRow2(screenWidth,LEA_VN,Utility.numbertoStringHour(widget.filc06a.ABS_MN!) );
    }
    else {
      return createRow2(screenWidth,LEA_VN,Utility.numbertoStringHour(widget.filc06a.LEA_H2!) );
    }
  }

  List<Widget> getList()
  {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> list=[];



    if(widget.filc06a.LEA_I1!.isNotEmpty)
      {
        list.add(getVacation(widget.filc06a.LEA_I1!,"LEA_H1",screenWidth));
      }
    if(widget.filc06a.LEA_I2!.isNotEmpty)
    {
      list.add(getVacation(widget.filc06a.LEA_I2!,"LEA_H2",screenWidth));
    }
    if(widget.filc06a.ABS_MN!>0)
    {
      list.add(getVacation(widget.filc06a.LEA_I2!,"ABS_MN",screenWidth));
    }
    


    list.add(createRow1(screenWidth, 'NGÀY THƯỜNG 正常日',false));
    list.add(createRow2(screenWidth,'CA NGÀY 正常工時(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.ATT_HR!))));
    list.add(createRow2(screenWidth,'TĂNG CA NGÀY 正常加班(GIỜ小時)',Utility.numbertoStringHour((widget.filc06a.OTT_HR!))));
    list.add(createRow2(screenWidth,'CA ĐÊM 正常夜班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.NIG_HR!))));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM 夜班加班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.NIG_OT!))));

    list.add(createRow1(screenWidth, 'CHỦ NHẬT 星期',false));
    list.add(createRow2(screenWidth,'NGÀY CHỦ NHẬT 週日班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.DOF_HR!))));
    list.add(createRow2(screenWidth,'TĂNG CA CHỦ NHẬT 週日加班(GIỜ小時)',Utility.numbertoStringHour((widget.filc06a.DOF_OT!))));
    list.add(createRow2(screenWidth,'ĐÊM CHỦ NHẬT 星期天晚班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.DON_OT!))));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM CHỦ NHẬT 週日通宵(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.DOF_OV!))));

    list.add(createRow1(screenWidth, 'NGÀY LỄ 國定假日',false));
    list.add(createRow2(screenWidth,'CA NGÀY LỄ 節日班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.HOL_HR!))));
    list.add(createRow2(screenWidth,'TĂNG CA NGÀY LỄ 節日加班(GIỜ小時)',Utility.numbertoStringHour((widget.filc06a.HOL_OT!))));
    list.add(createRow2(screenWidth,'CA ĐÊM LỄ 國定假日晚班(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.HON_HR!))));
    list.add(createRow2(screenWidth,'TĂNG CA ĐÊM LỄ 節日通宵(GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.HOL_OV!))));
    list.add(createRow1(screenWidth, 'CHUYÊN CẦN 考勤',false));
    list.add(createRow2(screenWidth,'ĐI TRỄ (LẦN蘭）',Utility.numbertoStringFormat((widget.filc06a.LAT_TM!), "#,###")));
    list.add(createRow2(screenWidth,'ĐI TRỄ (GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.LAT_MN!))));
    list.add(createRow2(screenWidth,'VỀ SỚM (LẦN蘭）',Utility.numbertoStringFormat((widget.filc06a.EAR_TM!), "#,###")));
    list.add(createRow2(screenWidth,'VỀ SỚM (GIỜ小時）',Utility.numbertoStringHour((widget.filc06a.EAR_MN!))));



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
