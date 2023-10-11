import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/state/fila15acontroller.dart';
import 'package:humanweb/state/filc06acontroller.dart';
import 'package:humanweb/state/gp_sys_shiftcontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
class ViewAttendanceDetail extends StatefulWidget
{
  int index;
   ViewAttendanceDetail({Key?key,required this.index}):super(key: key);

  @override
  _ViewAttendanceDetailState createState()=> _ViewAttendanceDetailState();
}
class _ViewAttendanceDetailState extends State<ViewAttendanceDetail>
{
  Filc06aController filc06aController=Get.find();
  Fila15aController fila15aController=Get.find();
  Gp_sys_ShiftController gp_sys_shiftController=Get.find();

  @override
  Widget build(BuildContext context) {
    var item=filc06aController.items[widget.index];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.MNU_04),
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed: (){Get.back();},),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Table(
          columnWidths: const {1: FixedColumnWidth(55),3: FixedColumnWidth(55)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(),
          children: [
            TableRow( children:[

              textLbel(LanguageService.ATT_DY),
              textNumber(item.ATT_DY!,'#,##0.####'),
              textLbel(LanguageService.NIG_DY),
              textNumber(item.NIG_DY!,'#,##0.####'),
            ]),
            TableRow( children:[

              textLbel(gp_sys_shiftController.returnField('ATT_HR')!),
              textNumberHour(item.ATT_HR!),
              textLbel(gp_sys_shiftController.returnField('NIG_HR')!),
              textNumberHour(item.NIG_HR!),
            ]),
            TableRow( children:[
              textLbel(gp_sys_shiftController.returnField('OTT_HR')!),
              textNumberHour(item.OTT_HR!),
              textLbel(gp_sys_shiftController.returnField('NIG_OT')!),
              textNumberHour(item.NIG_OT!),
            ]),
            TableRow( children:[
              textLbel(gp_sys_shiftController.returnField('DOF_HR')!),
              textNumberHour(item.DOF_HR!),
              textLbel(gp_sys_shiftController.returnField('DON_OT')!),
              textNumberHour(item.DON_OT!),
            ]),
            TableRow( children:[
              textLbel(gp_sys_shiftController.returnField('DOF_OT')!),
              textNumberHour(item.DOF_OT!),
              textLbel(gp_sys_shiftController.returnField('DOF_OV')!),
              textNumberHour(item.DOF_OV!),
            ]),
            TableRow( children:[
              textLbel(gp_sys_shiftController.returnField('HOL_HR')!),
              textNumberHour(item.HOL_HR!),
              textLbel(gp_sys_shiftController.returnField('HOL_OT')!),
              textNumberHour(item.HOL_OT!),
            ]),
            TableRow( children:[
              textLbel(LanguageService.LAT_MN),
              textNumberHour(item.LAT_MN!),
              textLbel(LanguageService.EAR_MN),
              textNumberHour(item.EAR_MN!),
            ]),
            TableRow(children:[
              textNumberLabel(label:'${LanguageService.LEA_I1} 1',value: fila15aController.findItem(item.LEA_I1!).LEA_VN!),
              textNumberHour(item.LEA_H1!),
              textNumberLabel(label:'${LanguageService.LEA_I1} 2',value: fila15aController.findItem(item.LEA_I2!).LEA_VN!),
              textNumberHour(item.LEA_H2!)

            ]),
            TableRow( children:[
              textLbel(LanguageService.ABS_MN),
              textNumberHour(item.ABS_MN!),
              textLbel(LanguageService.FOR_TM),
              textNumberHour(item.FOR_TM!),
            ]),
          ],
        ),
      ),
    );
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
    return Container(padding: const EdgeInsets.all(10),child: Text(value));
  }

  Widget textNumberHour(Object object)
  {
    return Container(alignment: Alignment.center,padding: const EdgeInsets.all(10),child: Text(Utility.numbertoStringHour(object)));
  }
}