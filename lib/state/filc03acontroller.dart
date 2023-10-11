
import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc03a.dart';

import 'package:humanweb/utilities/utility.dart';
class Filc03aController extends GetxController
{
  var isLoading =true.obs;
  RxList<FILC03A> _items =<FILC03A>[].obs;


  @override
  void onInit()
  {

   // SharedPreferencesRepository.init();

  //  fetchFILC03A(SharedPreferencesRepository.getString('EMP_ID'),Utility.datetoStringFormat(DateTime.now(), 'yyyyMM'));
   // super.onInit();
  }
  void fetchFILC03A(String EMP_ID,String YYY_MM)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getFILC03A(EMP_ID, YYY_MM);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<FILC03A> get items {
    return [..._items];
  }
  void userInit()
  {
    _items.clear();

  }

}