import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:humanweb/state/filc02acontroller.dart';
import 'package:humanweb/state/filc02bcontroller.dart';
import 'package:humanweb/state/gp_sys_shiftcontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:intl/intl.dart';
class ViewDetailShift extends StatefulWidget
{
  String shiid;
  ViewDetailShift({Key?key,required this.shiid}):super(key:key);


  @override
  _ViewDetailShiftState createState()=> _ViewDetailShiftState();
}
class _ViewDetailShiftState extends State<ViewDetailShift>
{
  Filc02bController filc02bController=Get.find();
  Gp_sys_ShiftController gp_sys_shiftController=Get.find();
  @override
  void initState() {
    feachData();
    super.initState();
  }

  void feachData()
  {
    filc02bController.isLoading(true);
    filc02bController.fetchProducts(widget.shiid);
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.ListShift),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios), onPressed: () => Get.back(),

        ),

      ),
      body: Padding(padding: const EdgeInsets.all(5),
        child:Obx(()=> Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(),
          children: createRow(),
        ),)),
    );
  }


  List<TableRow> createRow()
  {
    List<TableRow> itemList=[];
    //////caption
    TableRow caption=TableRow(
        decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(0)),
        children: [

      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.ONN_TM,style: const TextStyle(fontWeight: FontWeight.bold),)),
      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.OFF_TM,style: const TextStyle(fontWeight: FontWeight.bold),)),
      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.TYP_ID,style: const TextStyle(fontWeight: FontWeight.bold),)),
      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.WRK_HR,style:  const TextStyle(fontWeight: FontWeight.bold),)),
      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.MAN_OU,style:  const TextStyle(fontWeight: FontWeight.bold),)),
      Container(margin:const EdgeInsets.all(5),alignment: Alignment.center,child:  Text(LanguageService.LAT_BT,style:  const TextStyle(fontWeight: FontWeight.bold),)),
    ]);
    /////////////
    itemList.add(caption);

    filc02bController.findItem(widget.shiid).forEach((element) {
      TableRow r=TableRow(

          children: [
        Container(
          alignment: Alignment.center,
            child:
              Text(Utility.numbertoStringHour(element.ONN_TM!),)

        ),
        Container( alignment: Alignment.center, child: Text(Utility.numbertoStringHour(element.OFF_TM!))),
        Container(alignment: Alignment.center,child: Text(gp_sys_shiftController.returnField(element.TYP_ID!)!)),
        Container(alignment: Alignment.center,child: Text(Utility.numbertoStringHour(element.WRK_HR!))),
       Container(alignment: Alignment.center,child:Text(Utility.numbertoStringHour(element.MAN_OU!))),
        Checkbox(value: element.LAT_BT, onChanged: (value){}),
      ]);
      itemList.add(r);
    });

    return itemList;
  }
}