import 'package:flutter/cupertino.dart';


import 'package:get/get.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'button_widget.dart';
import 'date_range_picker_widget.dart';

class SearchOrder extends StatefulWidget{

  @override
  _SearchOrderState createState()=> _SearchOrderState();
}
class _SearchOrderState extends State<SearchOrder>
{
  DateRangeDate daterangedate=Get.find();
  Filc01aController filc01aController=Get.find();
  Filb01aController filb01aController=Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 10, left: 16, right: 16),
                  child: Row(
                    children:<Widget>[
                       Text(
                        LanguageService.FIN_DR,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),


                    ],
                  ),
                ),
              ],
            ),

            DateRangePickerWidget(),
            const SizedBox(height: 18),
            ButtonWidget(text:LanguageService.OK,onClicked :(){
              print('${daterangedate.dtFrom} - ${daterangedate.dtUntil} ');

              filc01aController.dateTodate(filb01aController.items[0].EMP_ID!, '${daterangedate.dtFrom}', '${daterangedate.dtUntil}');

              Get.back();
            }
            ),
            // Adding the form here
           // NewTaskForm(groupByValue:widget.groupByValue),
          ],
        ),
      ),
    );
  }

}