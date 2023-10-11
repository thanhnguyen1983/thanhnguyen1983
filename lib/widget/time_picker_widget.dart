
import 'package:flutter/material.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'button_widget.dart';

class TimePickerWidget extends StatefulWidget {

   String isFrom="";
   TimePickerWidget({Key? key,required this.isFrom});
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  TimeOfDay? time;
  _TimePickerWidgetState();

  DateRangeDate dateRangeDate=Get.find();
  String getText() {
    if (time == null) {
      return LanguageService.SEL_DT;
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Time',
        text: getText(),
        onClicked: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {

    final initialTime =  TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
        builder: (BuildContext context, Widget? child)
        {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        }
    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');
      if(widget.isFrom=="_timefrom") {
        dateRangeDate.hourForm('$hours:$minutes');
      } else {
        dateRangeDate.hourUntil('$hours:$minutes');
      }

    } );
  }
}
