import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/gp_sys_shift.dart';
import 'package:humanweb/utilities/languageservice.dart';

class Gp_sys_ShiftController extends GetxController
{
  var isLoading =true.obs;
  final RxList<GP_SYS_SHIFT> _items =<GP_SYS_SHIFT>[].obs;
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
      var products=await ApiService.getGP_SYS_SHIFT();
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  List<GP_SYS_SHIFT> get items {
    return [..._items];
  }
  String? returnField(String keyvalue)
  {
    var svalue='';
   for(var item in _items)
     {
       if(item.TYP_ID==keyvalue) {
         svalue=(LanguageService.defaultLanguage=='vn'?item.TYP_VN:item.TYP_CH)!;
       }
     }

    return svalue;
  }

}