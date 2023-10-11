import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc02a.dart';
class Filc02aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC02A> _items =<FILC02A>[].obs;
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
      var products=await ApiService.getFILC02A();
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  List<FILC02A> get items {
    return [..._items];
  }
  FILC02A findItem(String SHI_ID)
  {
    return _items[_items.indexWhere((element) => element.SHI_ID==SHI_ID)];
  }
}