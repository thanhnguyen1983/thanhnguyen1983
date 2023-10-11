import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanweb/page/attendance.dart';
import 'package:humanweb/utilities/languageservice.dart';
class ViewAttendance extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.MNU_01),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: ()=> Get.back(),
        ),
      ),
      body: Attendance(),
    );
  }

}