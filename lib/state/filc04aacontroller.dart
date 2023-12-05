import 'package:get/get.dart';
import 'package:humanweb/state/statuscodecontroller.dart';

import '../api/apiservice.dart';
import '../components/filc04aa.dart';

class Filc04aaController extends GetxController
{
  var isLoading =true.obs;
  var isLoadingAll =true.obs;
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
      isLoadingAll(true);
      _itemsall.clear();
      var products=await ApiService.getFILC04AA(EMP_ID,YYYYMM,sty);
      _itemsall.assignAll(products);
      print(products.toList());
    }finally{
      isLoadingAll(false);
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

void changebyCheck(bool isCheck)
{
  for(int i=0;i<_items.length;i++)
    {
      _items[i].MEA_BT=isCheck;
    }
  _items.refresh();
}
  void userInit()
  {
    _items.clear();

  }
}