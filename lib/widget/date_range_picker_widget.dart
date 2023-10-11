
import 'package:flutter/material.dart';
import 'package:humanweb/state/daterangedate.dart';
import 'package:humanweb/utilities/languageservice.dart';

import 'package:intl/intl.dart';

import 'button_widget.dart';
import 'package:get/get.dart';
class DateRangePickerWidget extends StatefulWidget {
  //final StringCallback callback;

 // DateRangePickerWidget({required this.callback});
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? dateRange;
  DateRangeDate dateRangeDate=Get.find();
  //_DateRangePickerWidgetState(this.dateRange);
  String getFrom() {
    if (dateRange == null) {
      return LanguageService.STR_DT;
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return LanguageService.END_DT;
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: ButtonWidget(
            text: getFrom(),
            onClicked: () => pickDateRange(context)
        ),
      ),
      const SizedBox(width: 2),
      const Icon(Icons.arrow_forward, color: Colors.white),
      const SizedBox(width: 2),
      Expanded(
        child: ButtonWidget(
          text: getUntil(),
          onClicked: () => pickDateRange(context),
        ),
      ),
    ],
  );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,

    );

    if (newDateRange == null) return;

    //setState(() =>
    // dateRange = newDateRange);

    setState(() {
      dateRange = newDateRange;

      dateRangeDate.dtFrom(DateFormat('yyyy/MM/dd').format(dateRange!.start)); //=DateFormat('dd/MM/yyyy').format(dateRange!.start).toString();
      dateRangeDate.dtUntil(DateFormat('yyyy/MM/dd').format(dateRange!.end));//=DateFormat('dd/MM/yyyy').format(dateRange!.end).toString();
     // VacationPage.of(context)!.stringfrom = DateFormat('dd/MM/yyyy').format(dateRange!.start);
      //VacationPage.of(context)!.stringuntil = DateFormat('dd/MM/yyyy').format(dateRange!.end);
    });

  }
}