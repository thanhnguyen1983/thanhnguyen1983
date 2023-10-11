import 'package:get/get.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filc06aa.dart';

class Filc06aaController extends GetxController
{
  var isLoading =true.obs;
  final RxList<FILC06AA> _items =<FILC06AA>[].obs;

  void fetchFILC06AA(String EMP_ID,String YYY_MM)async
  {


    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getFILC06AANew(EMP_ID, YYY_MM);
      _items.assignAll(list);
    }finally{
      isLoading(false);
    }
  }
  List<FILC06AA> get items {
    return [..._items];
  }
  void userInit()
  {
    _items.clear();

  }
  FILC06AA getitem()
  {
    if(_items.isNotEmpty) {
      return _items[0];
    }
    return FILC06AA(EMP_ID:'',YYY_MM:'',SEQ_NO:0,NOT_DR:'',BLT_NM:'',BLT_DT:'',LST_NM:'',LST_DT:'',LEA_I1:'',LEA_H1:0,LEA_I2:'',LEA_H2:0,LEA_I3:'',LEA_H3:0,LOC_B1:false,HOL_TT:0,ATT_HR:0,OTT_HR:0,OVO_HR:0,LAT_MN:0,LAT_TM:0,EAR_MN:0,EAR_TM:0,ABS_MN:0,ABS_TM:0,LEA_QT:0,ATT_DY:0,NIG_DY:0,NIG_HR:0,DOF_HR:0,DOF_OT:0,DOF_OV:0,HOL_HR:0,HOL_OT:0,HOL_OV:0,NIG_OT:0,NIG_OV:0,OTR_HR:0,LEA_001:0,LEA_002:0,LEA_003:0,LEA_004:0,LEA_005:0,LEA_006:0,LEA_007:0,LEA_008:0,LEA_009:0,LEA_010:0,LEA_011:0,LEA_012:0,LEA_013:0,LEA_014:0,LEA_015:0,LEA_016:0,LEA_017:0,LEA_018:0,LEA_019:0,LEA_020:0,LEA_021:0,DEP_I1:'',EMP_DW:'',BOS_AM:0,FIN_AM:0,PRO_FG:false,FOR_TM:0,LAT_T2:0,EAR_T2:0,LAT_M2:0,EAR_M2:0,OTT_TM:0,LEA_022:0,SEQ_OT:0,LAT_05:0,LAT_15:0,LAT_30:0,LAT_60:0,DON_OT:0,HON_HR:0,LEA_023:0,TRP_AM:0,MEA_TM:0,CAL_TM:0,DOF_VV:0,HOL_VV:0,TIM_AD:0,NIG_TT:0,BUU_HR:0,LEA_024:0,ATT_HR1:0,MOR_OT:0,LEA_025:0,MOB_FG:false,DAY_TM:0);
  }

}