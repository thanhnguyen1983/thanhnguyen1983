import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fila15a.dart';

class FrmSecurity2Controller extends GetxController
{
  var isLoading =false.obs;
  final RxInt _currentIndex =0.obs;
  @override
  void onInit()
  {

    super.onInit();
  }

  RxInt get currentIndex {
    return _currentIndex;
  }
  int SetcurrentIndex(int ind)
  {

    return _currentIndex.value=ind;
  }
}