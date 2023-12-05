
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
    return FILD02A(EMP_ID:'',YYY_MM:'',SEQ_NO:0,PRT_FG:false,DEP_ID:'',EMP_DW:'',LCK_BT:false,REM_DR:'',BLT_NM:'',BLT_DT:'',LST_NM:'',LST_DT:'',ROU_NM:'',ROU_DT:'',LuongCoBan:0,ThucLanh:0,TruKhac:0,BHXH:0,BHYT:0,TamUng:0,CongDoan:0,NCCaNgay:0,NCCaDem:0,PhepCoLuong:0,BHTN:0,TienThuong:0,ChuyenCan:0,NCTrongThang:0,TongNCCoLuong:0,TongTru:0,TienCom:0,TongLuong:0,tax_LeThuoc:0,tax_TienTCChiuThue:0,tax_ThuNhapChiuThue:0,tax_ThueTNCN:0,ThucLanh1:0,Thuong_BON:0,Phat_FIN:0,GhiChu:'',ThanhTien:0,LuongCoBanNC:0,Phep80:0,Tien80:0,TotalBH:0,VR:0,PB:0,PN:0,NL:0,PT:0,TNLD:0,PC:0,BuLuong:0,tax_TienTCMienThue:0,KP:0,TraPhepNam:0,SoPhanCom:0,KhamThai:0,TC13:0,TC15:0,TC20:0,TC30:0,TienTC13:0,TienTC15:0,TienTC20:0,TienTC30:0,ChuyenCanCB:0,TienPhanCom:0,TienCongDoan:0,BuCom:0,TruTienCom:0,ThuongK:0,TTBHYT:0,TienThuong1TT:0,TongLuong1:0,TongLuong2:0,TongLuong3:0,TCN15:0,N20:0,D20:0,PhepKhongLuong:0,TCD15:0,Adjustment:0,NCThucTe:0,Tien1ngaycong:0,Tien1GioCong:0,CongKhac:0,LuongCoBanBH:0,PCChucVuCB:0,PCNgonNguCB:0,LuongTinhTangCa:0,TCD20:0,ThucLanh2:0,TienTCD20:0,ThucLanh3:0,ThucPhat:0,is_BHXH:false,is_BHYT:false,BacLuong:0,TienPN:0,TienNL:0,PCTienCom:0,TienThuongSanLuong:0,KhauTruLuong:0,NP:0,TienPhepCoLuong:0,TienTCD15:0,ThuongCVCB:0,PCTrachNhiemCB:0,PCKyNangCB:0,PCMoiTruongCB:0,SoPhanComCT:0,TienComCongTac:0,TongPhuCap:0,LuongVaTongPhuCap:0,TongTienTangCa:0,TienTraPhepNam:0,TongThuNhap:0,PCPCCC:0,HoTroBHYT:0,BHXH_CTY:0,BHYT_CTY:0,BHTN_CTY:0,CongDoan_CTY:0,VoSinh:0,KL:0,CTYHOTROBH:0,MOB_FG:false,ThuongCV:0,PCTrachNhiem:0,PCKyNang:0,PCNgonNgu:0,PCChucVu:0,PCMoiTruong:0,TruyThuBHYT:0,PCPCCCCB:0,PCATVSMTCB:0,PCATVSMT:0,PCSCCCB:0,PCSCC:0,PCPhuNu:0,is_NguoiCaoTuoi:false,ManagerCB:0,ChuyenMonCB:0,PCDacBiet:0,ThuongDacBiet:0,Thuong:0,LuongVN:0,PCNuoiConCB:0,is_chuyenkhoan:false,PCT:0,QuenQuet:0,Tre:0,Som:0,NCKhongLam:0,TCD30:0,TienTCD30:0,TruVangMat:0);
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