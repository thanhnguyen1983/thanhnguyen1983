
import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/sys_menu.dart';




import '../components/getds.dart';
import '../utilities/utility.dart';

class SysMenuController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYS_MENU> _items =<SYS_MENU>[].obs;
  @override
  void onInit()
  {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts()async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYSMENU();
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<SYS_MENU> get items {
    return [..._items];
  }
  SYS_MENU findItem(String ID)
  {
    int index=_items.indexWhere((element) => element.ID.toString()==ID);
    if(index==-1) {
      return SYS_MENU();
    }
    return _items[index];
  }


}