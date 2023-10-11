import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filb01a.dart';

import '../api/ApiLogin.dart';

class Filb01aController extends GetxController
{
  var isLoading =true.obs;
  RxList<FILB01A> _items =<FILB01A>[].obs;

  Future<List<FILB01A>> Login(String EMP_ID,String pass)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiLogin.Login(EMP_ID, pass);
      if(list.isNotEmpty) {

        _items.assignAll(list);
      }
      return _items;
    }finally{
      isLoading(false);
    }
  }
  List<FILB01A> get items {
    return [..._items];
  }
  void addItem(List<FILB01A> l)
  {
    try {
      isLoading(true);
      _items.clear();
      _items.assignAll(l);
    }finally{
      isLoading(false);
    }
  }
}