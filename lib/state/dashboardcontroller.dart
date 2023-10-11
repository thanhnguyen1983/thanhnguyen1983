import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/dashboardclass.dart';

class DashBoardController extends GetxController
{
  var isLoading =true.obs;
  final RxList<DashBoardClass> _items =<DashBoardClass>[].obs;
  @override
  void onInit()
  {
    fetchProducts(DateTime.now().year,DateTime.now().month);
    super.onInit();
  }
  void fetchProducts(int yyyy,int mm)async
  {
    try{
      isLoading(true);
      _items.clear();
      var products=await ApiService.getDashBoard(yyyy, mm);
      _items.assignAll(products);

    }finally{
      isLoading(false);
    }
  }
  List<DashBoardClass> get items {
    return [..._items];
  }
  DashBoardClass? get item {
    if(_items.isEmpty) {
      return null;
    } else {
      return _items[0];
    }
  }
}