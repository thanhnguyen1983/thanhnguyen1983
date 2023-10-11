import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/sys_notification.dart';


class Sys_NotificationController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYS_NOTIFICATION> _items =<SYS_NOTIFICATION>[].obs;

  @override
  void onInit()
  {
   // SharedPreferencesRepository.init();
    
   // fetchSYS_NOTIFICATION(SharedPreferencesRepository.getString('EMP_ID'));
    super.onInit();
  }
  void fetchSYS_NOTIFICATION(String EMP_ID)async
  {


    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYS_NOTIFICATIONALL(EMP_ID,1);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<SYS_NOTIFICATION> get items {
    return [..._items];
  }
}