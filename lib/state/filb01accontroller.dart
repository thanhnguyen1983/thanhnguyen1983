import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filb01ac.dart';
class Filb01acController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILB01AC> _items =<FILB01AC>[].obs;
  final RxList<FILB01AC> _itemsbymonth =<FILB01AC>[].obs;
  @override
  void onInit()
  {
   // fetchProducts();
    super.onInit();
  }
  void fetchProducts(int yyyy)async
  {
    try{
      isLoading(true);
      _items.clear();
      var products=await ApiService.getFILB01AC(yyyy);
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  void fetchProductsMonth(int yyyy,int mm)async
  {
    try{
      isLoading(true);
      _itemsbymonth.clear();
      var products=await ApiService.getFILB01ACMonth(yyyy,mm);
      _itemsbymonth.assignAll(products);

    }finally{
      isLoading(false);
    }
  }

  List<FILB01AC> get items {
    return [..._items];
  }

}