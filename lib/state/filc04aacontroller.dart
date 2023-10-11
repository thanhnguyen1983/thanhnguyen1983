import 'package:get/get.dart';
import 'package:humanweb/state/statuscodecontroller.dart';

import '../api/apiservice.dart';
import '../components/filc04aa.dart';

class Filc04aaController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC04AA> _items =<FILC04AA>[].obs;
  final RxList<FILC04AA> _itemsall =<FILC04AA>[].obs;

  StatusCodeController statusCodeController=Get.find();
  void fetchProducts(String EMP_ID,String YYYYMM,String sty)async
  {
    try{
      isLoading(true);
      _items.clear();
      var products=await ApiService.getFILC04AA(EMP_ID,YYYYMM,sty);
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }

  void fetchProductsAll(String EMP_ID,String YYYYMM,String sty)async
  {
    try{
      isLoading(true);
      _itemsall.clear();
      var products=await ApiService.getFILC04AA(EMP_ID,YYYYMM,sty);
      _itemsall.assignAll(products);
      print(products.toList());
    }finally{
      isLoading(false);
    }
  }

  List<FILC04AA> get items {

    return [..._items];
  }

  List<FILC04AA> get itemsAll {
    return [..._itemsall];
  }
  void removeItem(int index)
  {
    _items.removeAt(index);
  }


  void userInit()
  {
    _items.clear();

  }
}