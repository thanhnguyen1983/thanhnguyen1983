import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc06a.dart';

class Filc06aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC06A> _items =<FILC06A>[].obs;

  void fetchFILC06A(String EMP_ID,String dt1,String dt2)async
  {


    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getFILC06ANew(EMP_ID, dt1,dt2);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<FILC06A> get items {
    return [..._items];
  }
  void userInit()
  {
    _items.clear();

  }
}