import 'package:get/get.dart';

class StatusCodeController extends GetxController
{
  var statuscode=0.obs;
  var messenge=''.obs;
  var isLoading =true.obs;
  void initStatusCode()
  {
     statuscode(0);
     messenge('');
  }

}