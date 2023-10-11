import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc02b.dart';
class Filc02bController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC02B> _items =<FILC02B>[].obs;
  @override
  void onInit()
  {
    fetchProducts('zzzzzzzzzzzzzzzzzzz');
    super.onInit();
  }
  void fetchProducts(String SHI_ID)async
  {
    try{
      isLoading(true);
      _items.clear();
      var products=await ApiService.getFILC02B(SHI_ID);
      if(products.isNotEmpty) {
        _items.assignAll(products);
      }

    }finally{
      isLoading(false);
    }
  }
  List<FILC02B> get items {
    return [..._items];
  }
  List<FILC02B> findItem(String SHI_ID)
  {
    return _items.where((p0) => p0.SHI_ID==SHI_ID).toList();
  }
}