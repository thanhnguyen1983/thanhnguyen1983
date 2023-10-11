import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/sys_label_vs.dart';

class Sys_Label_VsController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYS_LABEL_VS> _items =<SYS_LABEL_VS>[].obs;
  void fetchSYS_LABEL_VS(String name)async
  {


    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYS_LABEL_VS(name);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<SYS_LABEL_VS> get items {
    return [..._items];
  }
}