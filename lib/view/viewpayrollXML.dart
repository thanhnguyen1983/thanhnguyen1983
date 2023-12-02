import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/state/fild02acontroller.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';
import 'package:xml/xml.dart' as xml;
//import 'package:flutter_html/flutter_html.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/apiservice.dart';
import '../state/filb01acontroller.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';
class ViewPayrollXML extends StatefulWidget
{
  @override
  _ViewPayrollXMLState createState()=> _ViewPayrollXMLState();
}
class _ViewPayrollXMLState extends State<ViewPayrollXML>
{
  bool _isLoading = true;
  bool _firstshow = true;
  DateTime selectedDate = DateTime.now();
  Filb01aController filb01aController=Get.find();
  Fild02aController fild02aController=Get.put(Fild02aController());
  List<dynamic> body=[];

  @override
  void initState() {
    super.initState();
    fild02aController.fetchProducts(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
    //getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:  Text('${LanguageService.MNU_06} ${Utility.datetoStringFormat(selectedDate, 'MM/yyyy')}') ,
            actions: [
              IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.search))
            ]
        ),
        body:Obx(()=> ( fild02aController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(padding: const EdgeInsets.all(5),child: Column(children: getList(),),)),
      );

  }

  Future<void> _selectDate(BuildContext context) async {

    print('showMonthPicker');

    final pickedDate = await showMonthPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
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
        fild02aController.fetchProducts(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));
      });
    }
  }
    List<Widget> getList()
    {
      double screenWidth = MediaQuery.of(context).size.width;
      List<Widget> list=[];
      list.add(createRow2(screenWidth,'NGHỈ PHÉP NĂM 年假 (GIỜ小時）',Utility.numbertoStringFormat(fild02aController.getitem().PN!*8, "#,###.#") ));
      list.add(createRow2(screenWidth,'NGHỈ KL, VR, PB 無薪假、事假、病假(GIỜ小時)',Utility.numbertoStringFormat((fild02aController.getitem().KL! + fild02aController.getitem().VR!+ fild02aController.getitem().PB!)*8, "#,###.#")));
      list.add(createRow2(screenWidth,'KT, VS, DS 產檢、陪產假、休養假 (GIỜ小時)',Utility.numbertoStringFormat(fild02aController.getitem().VoSinh!*8, "#,###.#")));
      list.add(createRow2(screenWidth,'NGHỈ KHÔNG PHÉP 曠工  (GIỜ小時）',Utility.numbertoStringFormat(fild02aController.getitem().KP!*8, "#,###.#")));
      list.add(createRow2(screenWidth,'NGHỈ PHÉP TANG, KẾT HÔN 婚假、喪假  (GIỜ小時）',Utility.numbertoStringFormat((fild02aController.getitem().PT!+fild02aController.getitem().PC!)*8, "#,###.#")));
      list.add(createRow2(screenWidth,'PHÉP NĂM CÒN LẠI 剩餘年假  (GIỜ小時)',""));

      list.add(createRow3(screenWidth, 1, 'GIỜ CÔNG THỰC TẾ 工時', Utility.numbertoStringFormat(fild02aController.getitem().NCThucTe!, "#,###.#"), false));
      list.add(createRow3(screenWidth, 2, 'LƯƠNG CƠ BẢN 底薪', Utility.numbertoStringFormat(fild02aController.getitem().LuongCoBan!, "#,###"), false));
      list.add(createRow3(screenWidth, 3, 'PHỤ CẤP, THƯỞNG, TĂNG CA 津貼、獎金 (5 ->27)', Utility.numbertoStringFormat(fild02aController.getitem().ThucLanh1!, "#,###"), false));

      list.add(createRow3Bold(screenWidth, 4, 'TỔNG THU NHẬP 總薪資 = (2)+(3)', Utility.numbertoStringFormat(fild02aController.getitem().TongThuNhap!, "#,###"), true));
      list.add(createRow1(screenWidth, 'PHỤ CẤP, THƯỞNG, TĂNG CA 津貼、獎金',false));

      list.add(createRow3(screenWidth, 5, 'THƯỞNG CV 工作獎金', Utility.numbertoStringFormat(fild02aController.getitem().ThuongCVCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 6, 'TRÁCH NHIỆM 責任津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCTrachNhiemCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 7, 'KỸ NĂNG 技術津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCKyNangCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 8, 'NGÔN NGỮ 語言獎金', Utility.numbertoStringFormat(fild02aController.getitem().PCNgonNguCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 9, 'THƯỞNG KHUYẾN KHÍCH 專案激勵金( KPI )', Utility.numbertoStringFormat(fild02aController.getitem().TienThuongSanLuong!, "#,###"), false));
      list.add(createRow3(screenWidth, 10, 'PHỤ CẤP CHỨC VỤ 職務', Utility.numbertoStringFormat(fild02aController.getitem().PCChucVuCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 11, 'PHỤ CẤP MÔI TRƯỜNG 環境', Utility.numbertoStringFormat(fild02aController.getitem().PCMoiTruongCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 12, 'PC PCCC 消防津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCPCCCCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 13, 'PC ATVSMT 環境衛生隊津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCATVSMTCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 14, 'PC SCC 急救隊津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCSCCCB!, "#,###"), false));

      list.add(createRow4(screenWidth, 15, 'PHỤ CẤP CA ĐÊM  夜班補貼 (30%)', Utility.numbertoStringFormat(fild02aController.getitem().TC13!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTC13!, "#,###"),false));
      list.add(createRow4(screenWidth, 16, 'TĂNG CA THƯỜNG 平日加班 (150%)', Utility.numbertoStringFormat(fild02aController.getitem().TC15!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTC15!, "#,###"),false));
      list.add(createRow4(screenWidth, 17, 'TĂNG CA CHỦ NHẬT 晚班加班+假日班 (200%)', Utility.numbertoStringFormat(fild02aController.getitem().TC20!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTC20!, "#,###"),false));
      list.add(createRow4(screenWidth, 18, 'TĂNG CA CA ĐÊM (210%)', Utility.numbertoStringFormat(fild02aController.getitem().TCD15!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTCD15!, "#,###"),false));
      list.add(createRow4(screenWidth, 19, 'TĂNG CA CHỦ NHẬT 晚班加班+假日班 (270%)', Utility.numbertoStringFormat(fild02aController.getitem().TCD20!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTCD20!, "#,###"),false));
      list.add(createRow4(screenWidth, 20, 'TẾT 節日加班 (300%)', Utility.numbertoStringFormat(fild02aController.getitem().TC30!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTC30!, "#,###"),false));
      list.add(createRow4(screenWidth, 21, 'TĂNG CA ĐÊM LỄ 節日 (390%)', Utility.numbertoStringFormat(fild02aController.getitem().TCD30!, "#,###.#"), Utility.numbertoStringFormat(fild02aController.getitem().TienTCD30!, "#,###"),false));
      list.add(createRow4(screenWidth, 22, 'CƠM  伙食 (25.000/ 1 SUẤT ĂN 次)', Utility.numbertoStringFormat(fild02aController.getitem().SoPhanCom!, "#,###"), Utility.numbertoStringFormat(fild02aController.getitem().PCTienCom!, "#,###"),false));
      list.add(createRow4(screenWidth, 23, 'CƠM CÔNG TÁC 伙食  (35.000/ 1 SUẤT ĂN 次)', Utility.numbertoStringFormat(fild02aController.getitem().SoPhanComCT!, "#,###"), Utility.numbertoStringFormat(fild02aController.getitem().TienComCongTac!, "#,###"),false));

      list.add(createRow3(screenWidth, 24, 'THƯỞNG CHUYÊN CẦN 全勤獎金', Utility.numbertoStringFormat(fild02aController.getitem().ChuyenCan!, "#,###"), false));
      list.add(createRow3(screenWidth, 25, 'T/T PHÉP NĂM CL 特休補助', Utility.numbertoStringFormat(fild02aController.getitem().TienTraPhepNam!, "#,###"), false));
      list.add(createRow3(screenWidth, 26, 'PC NUÔI CON NHỎ 撫育小孩津貼', Utility.numbertoStringFormat(fild02aController.getitem().PCNuoiConCB!, "#,###"), false));
      list.add(createRow3(screenWidth, 27, 'PC KINH NGUYỆT 生理期補貼', Utility.numbertoStringFormat(fild02aController.getitem().PCPhuNu!, "#,###"), false));
      list.add(createRow3(screenWidth, 28, 'THU NHẬP KHÁC 其他補助', Utility.numbertoStringFormat(fild02aController.getitem().CongKhac!, "#,###"), false));

      list.add(createRow1(screenWidth, 'CÁC KHOẢN GIẢM TRỪ KHÁC 扣除額',false));
      list.add(createRow3(screenWidth, 29, 'VẮNG MẶT 請假', Utility.numbertoStringFormat(fild02aController.getitem().TruVangMat!, "#,###"), false));
      list.add(createRow3(screenWidth, 30, 'BHXH 社會保險 (8%)', Utility.numbertoStringFormat(fild02aController.getitem().BHXH!, "#,###"), false));
      list.add(createRow3(screenWidth, 31, 'BHYT 醫療保險 (1.5%)', Utility.numbertoStringFormat(fild02aController.getitem().BHYT!, "#,###"), false));
      list.add(createRow3(screenWidth, 32, 'BHTN 失業保險 (1%)', Utility.numbertoStringFormat(fild02aController.getitem().BHTN!, "#,###"), false));
      list.add(createRow3(screenWidth, 33, 'CÔNG ĐOÀN 工會 (1%)', Utility.numbertoStringFormat(fild02aController.getitem().CongDoan!, "#,###"), false));
      list.add(createRow3(screenWidth, 34, 'THUẾ TNCN 個人所得稅', Utility.numbertoStringFormat(fild02aController.getitem().tax_ThueTNCN!, "#,###"), false));
      list.add(createRow3(screenWidth, 35, 'GIẢM TRỪ KHÁC 其他', Utility.numbertoStringFormat(fild02aController.getitem().TruKhac!, "#,###"), true));
      list.add(createRow3Bold(screenWidth, 36, 'THỰC LÃNH 實領薪資 = (4)-(29+30+31+32+33+34+35)', Utility.numbertoStringFormat(fild02aController.getitem().ThucLanh!, "#,###"), true));
      list.add(createRow1(screenWidth, 'LƯƠNG BẢO MẬT NGHIÊM CẤM TRAO ĐỔI, THẢO LUẬN. 個人薪資屬於機密，禁止討論。',true));
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
          SizedBox(width: 80,child: Text('$value',textAlign: TextAlign.right,),),
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
