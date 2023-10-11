
import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fild01a.dart';




import '../components/getds.dart';
import '../utilities/utility.dart';

class Fild01aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILD01A> _items =<FILD01A>[].obs;
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
      var list=await ApiService.getFILD01A();
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<FILD01A> get items {
    return [..._items];
  }
  FILD01A findItem(String COL_NM)
  {
    int index=_items.indexWhere((element) => element.COL_NM.toString()==COL_NM);
    if(index==-1) {
      return FILD01A();
    }
    return _items[index];
  }
  Future<void> UpdateItem(FILD01A item)
  async {
    try
    {
      isLoading(true);
      int index=_items.indexWhere((element) => element.COL_NM==item.COL_NM);


      if (index >= 0) {
        _items[index].SEQ_MB = item.SEQ_MB;
        _items[index].SHO_MB = item.SHO_MB;
        _items[index].FormatString = item.FormatString;


        try {
          isLoading(true);

          String s = " UPDATE FILD01A SET SHO_MB=N'${item.SHO_MB}',SEQ_MB=N'${item.SEQ_MB}',FormatString=N'${item.FormatString}' WHERE COL_NM=N'${item.COL_NM}'";

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

     // sortItem();
      _items.refresh();

    }
    finally
    {
      isLoading(false);
    }

  }
 /* Future<void> sortItem()
  async {
    _items.sort((a, b) {
      if (a.SHO_MB == true && b.SHO_MB == false) {
        // Sort items with condition1 true before those with condition1 false
        return -1;
      } else if (a.SHO_MB == false && b.SHO_MB == true) {
        // Sort items with condition1 false after those with condition1 true
        return 1;
      } else {
        // If condition1 is the same, compare by condition2 (ascending order)
        return a.SEQ_MB!.compareTo(b.SEQ_MB!);
      }
    });


    try {
      isLoading(true);
      List<String> sql=[];
      int SEQ_MB=1;
      for (var element in _items) {

        print('${element.COL_VN}: ${element.SEQ_MB}');
        if(element.SHO_MB!)
          {
            String s = " UPDATE FILD01A SET SHO_MB=N'${element.SHO_MB}',SEQ_MB=N'${SEQ_MB}',FormatString=N'${element.FormatString}' WHERE COL_NM=N'${element.COL_NM}'";
            _items[_items.indexOf(element)].SEQ_MB=SEQ_MB;
            SEQ_MB++;
            sql.add(s);
          }

      }


      GetDS getDS = GetDS(
          sselect: "",
          suser: "",
          sty: "ExecuteSql",
          listselect: sql

      );
      int res = await ApiService.ExecuteSql(getDS);
      fetchProducts();

    }
    finally
    {

      isLoading(false);
    }

  }*/

}