import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';

import 'filb01acontroller.dart';

class SystemController extends GetxController
{


  var isLoading =true.obs;
  var avata='avata'.obs;
  var selectedDate=DateTime.now().obs;
  var isLastMonth=false.obs;
  var isadmin=false.obs;
  var username=''.obs;
  var STY=1.obs;
  var YYYY=DateTime.now().year.toString().obs;
  var MM=DateTime.now().month.toString().obs;
  var changePass=false.obs;
  var token=''.obs;
  var email=''.obs;
  var GROUP_ID=''.obs;
  var ID=0.obs;
    void fetchProducts()async
    {
      try{
        isLoading(true);

       // var value=await ApiService.getAvata(filb01aController.items[0].EMP_ID!);
       // avata.value=value;

      }finally{
        isLoading(false);
      }
    }


}