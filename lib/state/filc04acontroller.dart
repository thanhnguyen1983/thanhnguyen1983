import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc04a.dart';
import 'package:humanweb/components/objectvacation.dart';
import 'package:humanweb/state/statuscodecontroller.dart';

class Filc04aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC04A> _items =<FILC04A>[].obs;
  StatusCodeController statusCodeController=Get.find();
  void fetchProducts(String EMP_ID,String YYY_MM)async
  {
    try{
      isLoading(true);
      _items.clear();
      var products=await ApiService.getFILC04A(EMP_ID,YYY_MM);
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  List<FILC04A> get items {
    return [..._items];
  }

  void approvalVacation(ObjectVacation  item)async
  {
    try{
      isLoading(true);
      var products=await ApiService.vacation(item);

     // statusCodeController.messenge.value=products;

    //  print(products);
    }
    finally{
      isLoading(false);

    }

  }

  void userInit()
  {
    _items.clear();

  }
}