import 'package:get/get.dart';

import '../api/apiservice.dart';
import '../components/fild03a.dart';
class Fild03aController extends GetxController
{
  var isLoading =true.obs;
  RxList<FILD03A> _items =<FILD03A>[].obs;

  void fetchFILD03A(String EMP_ID,String LAG_NM)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getFILD03A(EMP_ID, LAG_NM);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<FILD03A> get items {
    return [..._items];
  }
}