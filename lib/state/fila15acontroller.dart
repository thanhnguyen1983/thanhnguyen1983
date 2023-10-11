import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fila15a.dart';

class Fila15aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILA15A> _items =<FILA15A>[].obs;
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
      var products=await ApiService.getFILA15A();
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  List<FILA15A> get items {
    return [..._items];
  }
  FILA15A findItem(String LEA_ID)
  {
    int index=_items.indexWhere((element) => element.LEA_ID==LEA_ID);
    if(index==-1) {
      return FILA15A(LEA_VN: '');
    }
    return _items[index];
  }
}