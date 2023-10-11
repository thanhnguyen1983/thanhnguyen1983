import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/SYS_SECURITY.dart';
import 'package:humanweb/components/fila15a.dart';

import '../components/SYS_GROUP.dart';
import '../components/getds.dart';
import '../utilities/utility.dart';

class SysSecurityController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYS_SECURITY> _items =<SYS_SECURITY>[].obs;
  @override
  void onInit()
  {
    //fetchProducts();
    super.onInit();
  }
  void fetchProducts(String GROUP_ID)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYSSECURITY(GROUP_ID);
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<SYS_SECURITY> get items {
    return [..._items];
  }
  SYS_SECURITY findItem(String GROUP_ID)
  {
    int index=_items.indexWhere((element) => element.GROUP_ID==GROUP_ID);
    if(index==-1) {
      return SYS_SECURITY(GROUP_ID: '',MNU_ID: 0,MNU_NM: '',ADD: false,UPDATE: false,DELETE: false,USAGE: false,PRINT: false);
    }
    return _items[index];
  }

  Future<void> UpdateItem(SYS_SECURITY item)
  async {
    try
    {
      isLoading(true);
      int index=_items.indexWhere((element) => element.GROUP_ID==item.GROUP_ID && element.MNU_ID==item.MNU_ID);

      if(item.GROUP_ID=='') {

        int SEQ_NO=int.parse(_items.last.GROUP_ID.toString())+1;
        item.GROUP_ID=Utility.numbertoStringFormat(SEQ_NO,"000");


      }
      if (index >= 0) {


        _items[index].ADD = item.ADD;
        _items[index].UPDATE = item.UPDATE;
        _items[index].DELETE = item.DELETE;
        _items[index].USAGE = item.USAGE;
        _items[index].PRINT = item.PRINT;
        _items[index].APROVAL = item.APROVAL;

        try {
          isLoading(true);

          String s = " UPDATE SYS_SECURITY SET ADD=N'${item.ADD}',UPDATE=N'${item.UPDATE}',DELETE=N'${item.DELETE}',USAGE=N'${item.USAGE}',PRINT=N'${item.PRINT}',APV_BT=N'${item.APROVAL}' WHERE GROUP_ID=N'${item.GROUP_ID}' and MNU_ID=N'${item.MNU_ID}'";

          GetDS getDS = GetDS(
              sselect: "",
              suser: "",
              sty: "ExecuteSql",
              listselect: [s]

          );
          int res = await ApiService.ExecuteSql(getDS);

        }
        finally
        {

          isLoading(false);
        }

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