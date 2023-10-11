
import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fild02a.dart';




import '../components/getds.dart';
import '../utilities/utility.dart';

class Fild02aController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILD02A> _items =<FILD02A>[].obs;
  @override
  void onInit()
  {
    //fetchProducts();
    super.onInit();
  }
  void fetchProducts(String EMP_ID,String YYYYMM )async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getFILD02ANew(EMP_ID,YYYYMM);
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<FILD02A> get items {
    return [..._items];
  }
  FILD02A getitem()
  {
    if(_items.isNotEmpty) {
      return _items[0];
    }
    return FILD02A(TruVangMat: 0,PN: 0,KL: 0,VR: 0,PB: 0,VoSinh: 0,KP: 0,PT:0,PC: 0,NCThucTe: 0,LuongCoBan: 0,ThucLanh1: 0,TongThuNhap: 0,ThuongCVCB: 0,PCTrachNhiemCB: 0,PCKyNangCB: 0,PCNgonNguCB: 0,TienThuongSanLuong: 0,PCChucVuCB: 0,PCMoiTruongCB: 0,PCPCCCCB: 0,PCATVSMTCB: 0,PCSCCCB: 0,TC13: 0,TienTC13: 0,TC15: 0,TienTC15: 0,TC20: 0,TienTC20: 0,TCD20: 0,TienTCD20: 0,TC30: 0,TienTC30: 0,TCD30: 0,TienTCD30: 0,SoPhanCom: 0,PCTienCom: 0,SoPhanComCT: 0,TienComCongTac: 0,ChuyenCan: 0,TienTraPhepNam: 0,PCNuoiConCB: 0,PCPhuNu: 0,CongKhac: 0,BHXH: 0,BHYT: 0,BHTN: 0,CongDoan: 0,tax_ThueTNCN: 0,TruKhac: 0,ThucLanh: 0);
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