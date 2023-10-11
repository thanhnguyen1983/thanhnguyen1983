import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/SYS_GROUP_DEP.dart';
import 'package:humanweb/components/fila15a.dart';

import '../components/SYS_GROUP.dart';
import '../components/getds.dart';
import '../utilities/utility.dart';

class SysGroupDepController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYS_GROUP_DEP> _items =<SYS_GROUP_DEP>[].obs;
  @override
  void onInit()
  {

    super.onInit();
  }
  void fetchProducts(String COM_ID,String GROUP_ID)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYSGROUPDEP(COM_ID,GROUP_ID);
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<SYS_GROUP_DEP> get items {
    return [..._items];
  }
  SYS_GROUP_DEP findItem(String GROUP_ID,String DEP_ID,String COM_ID)
  {
    int index=_items.indexWhere((element) => element.GROUP_ID==GROUP_ID && element.DEP_ID==DEP_ID && element.COM_ID==COM_ID);
    if(index==-1) {
      return SYS_GROUP_DEP(DEP_NM: '',DEP_ID:'',COM_ID: '',GROUP_ID: '',APV_FG: false);
    }
    return _items[index];
  }

  Future<void> UpdateItem(SYS_GROUP_DEP item)
  async {
    try
    {
      isLoading(true);
      int index=_items.indexWhere((element) => element.GROUP_ID==item.GROUP_ID && element.DEP_ID==item.DEP_ID && element.COM_ID==item.COM_ID);

      if(item.DEP_ID=='') {

        int SEQ_NO=int.parse(_items.last.DEP_ID.toString())+1;
        item.DEP_ID=Utility.numbertoStringFormat(SEQ_NO,"000");


      }
      if (index >= 0) {


        _items[index].APV_FG = item.APV_FG;
        try {
          isLoading(true);

          String s = " UPDATE SYS_GROUP_DEP SET APV_FG=N'${item.APV_FG}' WHERE DEP_ID=N'${item.DEP_ID}' and GROUP_ID=N'${item.GROUP_ID}'";

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