import 'package:get/get.dart';

class DateRangeDate extends GetxController
{
  var dtFrom="".obs;
  var dtUntil="".obs;
  var hourForm=''.obs;
  var hourUntil=''.obs;

  void init(){
    dtFrom("");
    dtUntil("");
    hourForm('');
    hourUntil('');
  }
}