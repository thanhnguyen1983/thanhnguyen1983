import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc01a.dart';

import 'package:humanweb/utilities/utility.dart';
import 'package:intl/intl.dart';

import 'filb01acontroller.dart';
class Filc01aController extends GetxController
{
  RxList<FILC01A> _items =<FILC01A>[].obs;
  Filb01aController filb01aController=Get.find();
  var isLoading =true.obs;

  @override
  void onInit()
  {
   // fetchProducts();
    super.onInit();
    fetchProducts();
  }
  void fetchProducts()async
  {
    var dt=Utility.datetoStringFormat(DateTime.now(), 'yyyy/MM/dd') ;

    try{
      isLoading(true);
      _items.clear();


      var products=await ApiService.dtFILC01A(filb01aController.items[0].EMP_ID!,dt,dt);

      _items.assignAll(products);


    }finally{
      isLoading(false);
    }
  }

  void setAllItem(List<FILC01A> items)
  {

    try {
      isLoading(true);
      _items.clear();
      _items.assignAll(items);
    }finally{
      isLoading(false);
    }

  }
  List<FILC01A> get items {
    return [..._items];
  }
  void dateTodate(String EMP_ID,String dt1,String dt2) async{

    try {
      _items.clear();
      isLoading(true);

      var products = await ApiService.dtFILC01A(
          EMP_ID, dt1, dt2);
      _items.assignAll(products);
    }finally{
      isLoading(false);
    }
  }
  void userInit()
  {
    _items.clear();

  }
}