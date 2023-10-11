import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fila15a.dart';

import '../components/SYS_GROUP.dart';
import '../utilities/utility.dart';

class SysGroupController extends GetxController
{
  var isLoading =true.obs;
  final RxList<sbmfrmSecurity_vs> _items =<sbmfrmSecurity_vs>[].obs;
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
      var list=await ApiService.getSYSGROUP();
      _items.assignAll(list);
     // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<sbmfrmSecurity_vs> get items {
    return [..._items];
  }
  sbmfrmSecurity_vs findItem(String GROUP_ID)
  {
    int index=_items.indexWhere((element) => element.GROUP_ID==GROUP_ID);
    if(index==-1) {
      return sbmfrmSecurity_vs(GROUP_ID: '',GROUP_NM: '',COM_ID: '');
    }
    return _items[index];
  }

  void UpdateItem(sbmfrmSecurity_vs item)
  {
    try
    {
      isLoading(true);
      int index=_items.indexWhere((element) => element.GROUP_ID==item.GROUP_ID);

      if(item.GROUP_ID=='') {

        int SEQ_NO=int.parse(_items.last.GROUP_ID.toString())+1;
        item.GROUP_ID=Utility.numbertoStringFormat(SEQ_NO,"000");


      }
      if (index >= 0) {
        _items[index].GROUP_NM = item.GROUP_NM;

        _items[index].GROUP_ID = item.GROUP_ID;

      }
      else {
        _items.add(item);
      }


      _items.refresh();

    }
    finally
    {
      isLoading(false);
    }

  }
}