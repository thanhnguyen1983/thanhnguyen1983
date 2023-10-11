class FILC06A
{
  String? EMP_ID;
  String? ATT_DT;
  String? DEP_ID;
  String? EMP_I1;
  String? SHI_ID;
  String? NOT_OR;
  String? NOT_DR;
  String? NOT_D1;
  String? NIG_TM;
  double? ONN_01;
  double? OFF_01;
  double? ONN_02;
  double? OFF_02;
  double? ONN_03;
  double? OFF_03;
  double? ONN_04;
  double? OFF_04;
  double? ONN_05;
  double? OFF_05;
  double? ONN_06;
  double? OFF_06;
  double? OFF_07;
  double? ONN_07;
  double? OFF_08;
  double? ONN_08;
  double? ONN_09;
  double? OFF_09;
  double? ONN_10;
  double? OFF_10;
  double? ATT_HR;
  double? OTT_HR;
  double? OVO_HR;
  double? LAT_MN;
  int? LAT_TM;
  double? EAR_MN;
  int? EAR_TM;
  double? ABS_MN;
  int? ABS_TM;
  double? ATT_DY;
  double? NIG_DY;
  bool? LOC_BT;
  bool? LOC_B1;
  String? USR_CK;
  double? NIG_HR;
  double? DOF_HR;
  double? DOF_OT;
  double? DOF_OV;
  double? HOL_HR;
  double? HOL_OT;
  double? HOL_OV;
  double? NIG_OT;
  double? NIG_OV;
  String? LEA_I1;
  double? LEA_H1;
  String? LEA_I2;
  double? LEA_H2;
  String? LEA_I3;
  double? LEA_H3;
  double? OTR_HR;
  int? FOR_TM;
  int? LAT_T2;
  int? EAR_T2;
  double? LAT_M2;
  double? EAR_M2;
  int? FOR_T1;
  int? OTT_TM;
  double? OTT_MF;
  int? SEQ_OT;
  int? LAT_05;
  int? LAT_15;
  int? LAT_30;
  int? LAT_60;
  double? DON_OT;
  double? HON_HR;
  double? TRP_AM;
  int? MEA_TM;
  int? CAL_TM;
  double? DOF_VV;
  double? HOL_VV;
  double? TIM_AD;
  String? TIM_NM;
  bool? GPS_BT;
  int? NIG_TT;
  double? BUU_HR;
  double? ATT_HR1;
  double? MOR_OT;
  String? REM_D2;
  double? DAY_TM;

  FILC06A({this.EMP_ID,this.ATT_DT,this.DEP_ID,this.EMP_I1,this.SHI_ID,this.NOT_OR,this.NOT_DR,this.NOT_D1,this.NIG_TM,this.ONN_01,this.OFF_01,this.ONN_02,this.OFF_02,this.ONN_03,this.OFF_03,this.ONN_04,this.OFF_04,this.ONN_05,this.OFF_05,this.ONN_06,this.OFF_06,this.OFF_07,this.ONN_07,this.OFF_08,this.ONN_08,this.ONN_09,this.OFF_09,this.ONN_10,this.OFF_10,this.ATT_HR,this.OTT_HR,this.OVO_HR,this.LAT_MN,this.LAT_TM,this.EAR_MN,this.EAR_TM,this.ABS_MN,this.ABS_TM,this.ATT_DY,this.NIG_DY,this.LOC_BT,this.LOC_B1,this.USR_CK,this.NIG_HR,this.DOF_HR,this.DOF_OT,this.DOF_OV,this.HOL_HR,this.HOL_OT,this.HOL_OV,this.NIG_OT,this.NIG_OV,this.LEA_I1,this.LEA_H1,this.LEA_I2,this.LEA_H2,this.LEA_I3,this.LEA_H3,this.OTR_HR,this.FOR_TM,this.LAT_T2,this.EAR_T2,this.LAT_M2,this.EAR_M2,this.FOR_T1,this.OTT_TM,this.OTT_MF,this.SEQ_OT,this.LAT_05,this.LAT_15,this.LAT_30,this.LAT_60,this.DON_OT,this.HON_HR,this.TRP_AM,this.MEA_TM,this.CAL_TM,this.DOF_VV,this.HOL_VV,this.TIM_AD,this.TIM_NM,this.GPS_BT,this.NIG_TT,this.BUU_HR,this.ATT_HR1,this.MOR_OT,this.REM_D2,this.DAY_TM});
  factory FILC06A.fromJson(Map<String,dynamic> json)=>
      FILC06A(
          EMP_ID: json['EMP_ID'] ??'',
          ATT_DT: json['ATT_DT'] ??'',
          DEP_ID: json['DEP_ID'] ??'',
          EMP_I1: json['EMP_I1'] ??'',
          SHI_ID: json['SHI_ID'] ??'',
          NOT_OR: json['NOT_OR'] ??'',
          NOT_DR: json['NOT_DR'] ??'',
          NOT_D1: json['NOT_D1'] ??'',
          NIG_TM: json['NIG_TM'] ??'',
          ONN_01:json['ONN_01']!=null? json['ONN_01'] as double:0.0,
          OFF_01:json['OFF_01']!=null? json['OFF_01'] as double:0.0,
          ONN_02:json['ONN_02']!=null? json['ONN_02'] as double:0.0,
          OFF_02:json['OFF_02']!=null? json['OFF_02'] as double:0.0,
          ONN_03:json['ONN_03']!=null? json['ONN_03'] as double:0.0,
          OFF_03:json['OFF_03']!=null? json['OFF_03'] as double:0.0,
          ONN_04:json['ONN_04']!=null? json['ONN_04'] as double:0.0,
          OFF_04:json['OFF_04']!=null? json['OFF_04'] as double:0.0,
          ONN_05:json['ONN_05']!=null? json['ONN_05'] as double:0.0,
          OFF_05:json['OFF_05']!=null? json['OFF_05'] as double:0.0,
          ONN_06:json['ONN_06']!=null? json['ONN_06'] as double:0.0,
          OFF_06:json['OFF_06']!=null? json['OFF_06'] as double:0.0,
          OFF_07:json['OFF_07']!=null? json['OFF_07'] as double:0.0,
          ONN_07:json['ONN_07']!=null? json['ONN_07'] as double:0.0,
          OFF_08:json['OFF_08']!=null? json['OFF_08'] as double:0.0,
          ONN_08:json['ONN_08']!=null? json['ONN_08'] as double:0.0,
          ONN_09:json['ONN_09']!=null? json['ONN_09'] as double:0.0,
          OFF_09:json['OFF_09']!=null? json['OFF_09'] as double:0.0,
          ONN_10:json['ONN_10']!=null? json['ONN_10'] as double:0.0,
          OFF_10:json['OFF_10']!=null? json['OFF_10'] as double:0.0,
          ATT_HR:json['ATT_HR']!=null? json['ATT_HR'] as double:0.0,
          OTT_HR:json['OTT_HR']!=null? json['OTT_HR'] as double:0.0,
          OVO_HR:json['OVO_HR']!=null? json['OVO_HR'] as double:0.0,
          LAT_MN:json['LAT_MN']!=null? json['LAT_MN'] as double:0.0,
          LAT_TM:json['LAT_TM']!=null? json['LAT_TM'] as int:0,
          EAR_MN:json['EAR_MN']!=null? json['EAR_MN'] as double:0.0,
          EAR_TM:json['EAR_TM']!=null? json['EAR_TM'] as int:0,
          ABS_MN:json['ABS_MN']!=null? json['ABS_MN'] as double:0.0,
          ABS_TM:json['ABS_TM']!=null? json['ABS_TM'] as int:0,
          ATT_DY:json['ATT_DY']!=null? json['ATT_DY'] as double:0.0,
          NIG_DY:json['NIG_DY']!=null? json['NIG_DY'] as double:0.0,
          LOC_BT: json['LOC_BT'] as bool,
          LOC_B1: json['LOC_B1'] as bool,
          USR_CK: json['USR_CK'] ??'',
          NIG_HR:json['NIG_HR']!=null? json['NIG_HR'] as double:0.0,
          DOF_HR:json['DOF_HR']!=null? json['DOF_HR'] as double:0.0,
          DOF_OT:json['DOF_OT']!=null? json['DOF_OT'] as double:0.0,
          DOF_OV:json['DOF_OV']!=null? json['DOF_OV'] as double:0.0,
          HOL_HR:json['HOL_HR']!=null? json['HOL_HR'] as double:0.0,
          HOL_OT:json['HOL_OT']!=null? json['HOL_OT'] as double:0.0,
          HOL_OV:json['HOL_OV']!=null? json['HOL_OV'] as double:0.0,
          NIG_OT:json['NIG_OT']!=null? json['NIG_OT'] as double:0.0,
          NIG_OV:json['NIG_OV']!=null? json['NIG_OV'] as double:0.0,
          LEA_I1: json['LEA_I1'] ??'',
          LEA_H1:json['LEA_H1']!=null? json['LEA_H1'] as double:0.0,
          LEA_I2: json['LEA_I2'] ??'',
          LEA_H2:json['LEA_H2']!=null? json['LEA_H2'] as double:0.0,
          LEA_I3: json['LEA_I3'] ??'',
          LEA_H3:json['LEA_H3']!=null? json['LEA_H3'] as double:0.0,
          OTR_HR:json['OTR_HR']!=null? json['OTR_HR'] as double:0.0,
          FOR_TM:json['FOR_TM']!=null? json['FOR_TM'] as int:0,
          LAT_T2:json['LAT_T2']!=null? json['LAT_T2'] as int:0,
          EAR_T2:json['EAR_T2']!=null? json['EAR_T2'] as int:0,
          LAT_M2:json['LAT_M2']!=null? json['LAT_M2'] as double:0.0,
          EAR_M2:json['EAR_M2']!=null? json['EAR_M2'] as double:0.0,
          FOR_T1:json['FOR_T1']!=null? json['FOR_T1'] as int:0,
          OTT_TM:json['OTT_TM']!=null? json['OTT_TM'] as int:0,
          OTT_MF:json['OTT_MF']!=null? json['OTT_MF'] as double:0.0,
          SEQ_OT:json['SEQ_OT']!=null? json['SEQ_OT'] as int:0,
          LAT_05:json['LAT_05']!=null? json['LAT_05'] as int:0,
          LAT_15:json['LAT_15']!=null? json['LAT_15'] as int:0,
          LAT_30:json['LAT_30']!=null? json['LAT_30'] as int:0,
          LAT_60:json['LAT_60']!=null? json['LAT_60'] as int:0,
          DON_OT:json['DON_OT']!=null? json['DON_OT'] as double:0.0,
          HON_HR:json['HON_HR']!=null? json['HON_HR'] as double:0.0,
          TRP_AM:json['TRP_AM']!=null? json['TRP_AM'] as double:0.0,
          MEA_TM:json['MEA_TM']!=null? json['MEA_TM'] as int:0,
          CAL_TM:json['CAL_TM']!=null? json['CAL_TM'] as int:0,
          DOF_VV:json['DOF_VV']!=null? json['DOF_VV'] as double:0.0,
          HOL_VV:json['HOL_VV']!=null? json['HOL_VV'] as double:0.0,
          TIM_AD:json['TIM_AD']!=null? json['TIM_AD'] as double:0.0,
          TIM_NM: json['TIM_NM'] ??'',
          GPS_BT: json['GPS_BT'] as bool,
          NIG_TT:json['NIG_TT']!=null? json['NIG_TT'] as int:0,
          BUU_HR:json['BUU_HR']!=null? json['BUU_HR'] as double:0.0,
          ATT_HR1:json['ATT_HR1']!=null? json['ATT_HR1'] as double:0.0,
          MOR_OT:json['MOR_OT']!=null? json['MOR_OT'] as double:0.0,
          REM_D2: json['REM_D2'] ??'',
          DAY_TM:json['DAY_TM']!=null? json['DAY_TM'] as double:0.0
      );
  Map<String,dynamic> toJson()=>{
    'EMP_ID':EMP_ID??'',
    'ATT_DT':ATT_DT??'',
    'DEP_ID':DEP_ID??'',
    'EMP_I1':EMP_I1??'',
    'SHI_ID':SHI_ID??'',
    'NOT_OR':NOT_OR??'',
    'NOT_DR':NOT_DR??'',
    'NOT_D1':NOT_D1??'',
    'NIG_TM':NIG_TM??'',
    'ONN_01':ONN_01??0,
    'OFF_01':OFF_01??0,
    'ONN_02':ONN_02??0,
    'OFF_02':OFF_02??0,
    'ONN_03':ONN_03??0,
    'OFF_03':OFF_03??0,
    'ONN_04':ONN_04??0,
    'OFF_04':OFF_04??0,
    'ONN_05':ONN_05??0,
    'OFF_05':OFF_05??0,
    'ONN_06':ONN_06??0,
    'OFF_06':OFF_06??0,
    'OFF_07':OFF_07??0,
    'ONN_07':ONN_07??0,
    'OFF_08':OFF_08??0,
    'ONN_08':ONN_08??0,
    'ONN_09':ONN_09??0,
    'OFF_09':OFF_09??0,
    'ONN_10':ONN_10??0,
    'OFF_10':OFF_10??0,
    'ATT_HR':ATT_HR??0,
    'OTT_HR':OTT_HR??0,
    'OVO_HR':OVO_HR??0,
    'LAT_MN':LAT_MN??0,
    'LAT_TM':LAT_TM??0,
    'EAR_MN':EAR_MN??0,
    'EAR_TM':EAR_TM??0,
    'ABS_MN':ABS_MN??0,
    'ABS_TM':ABS_TM??0,
    'ATT_DY':ATT_DY??0,
    'NIG_DY':NIG_DY??0,
    'LOC_BT':LOC_BT!?1:0,
    'LOC_B1':LOC_B1!?1:0,
    'USR_CK':USR_CK??'',
    'NIG_HR':NIG_HR??0,
    'DOF_HR':DOF_HR??0,
    'DOF_OT':DOF_OT??0,
    'DOF_OV':DOF_OV??0,
    'HOL_HR':HOL_HR??0,
    'HOL_OT':HOL_OT??0,
    'HOL_OV':HOL_OV??0,
    'NIG_OT':NIG_OT??0,
    'NIG_OV':NIG_OV??0,
    'LEA_I1':LEA_I1??'',
    'LEA_H1':LEA_H1??0,
    'LEA_I2':LEA_I2??'',
    'LEA_H2':LEA_H2??0,
    'LEA_I3':LEA_I3??'',
    'LEA_H3':LEA_H3??0,
    'OTR_HR':OTR_HR??0,
    'FOR_TM':FOR_TM??0,
    'LAT_T2':LAT_T2??0,
    'EAR_T2':EAR_T2??0,
    'LAT_M2':LAT_M2??0,
    'EAR_M2':EAR_M2??0,
    'FOR_T1':FOR_T1??0,
    'OTT_TM':OTT_TM??0,
    'OTT_MF':OTT_MF??0,
    'SEQ_OT':SEQ_OT??0,
    'LAT_05':LAT_05??0,
    'LAT_15':LAT_15??0,
    'LAT_30':LAT_30??0,
    'LAT_60':LAT_60??0,
    'DON_OT':DON_OT??0,
    'HON_HR':HON_HR??0,
    'TRP_AM':TRP_AM??0,
    'MEA_TM':MEA_TM??0,
    'CAL_TM':CAL_TM??0,
    'DOF_VV':DOF_VV??0,
    'HOL_VV':HOL_VV??0,
    'TIM_AD':TIM_AD??0,
    'TIM_NM':TIM_NM??'',
    'GPS_BT':GPS_BT!?1:0,
    'NIG_TT':NIG_TT??0,
    'BUU_HR':BUU_HR??0,
    'ATT_HR1':ATT_HR1??0,
    'MOR_OT':MOR_OT??0,
    'REM_D2':REM_D2??'',
    'DAY_TM':DAY_TM??0
  };
  Map<String, String> mapFields={'EMP_ID':'nvarchar','ATT_DT':'datetime','DEP_ID':'nvarchar','EMP_I1':'nvarchar','SHI_ID':'nvarchar','NOT_OR':'nvarchar','NOT_DR':'nvarchar','NOT_D1':'nvarchar','NIG_TM':'nvarchar','ONN_01':'float','OFF_01':'float','ONN_02':'float','OFF_02':'float','ONN_03':'float','OFF_03':'float','ONN_04':'float','OFF_04':'float','ONN_05':'float','OFF_05':'float','ONN_06':'float','OFF_06':'float','OFF_07':'float','ONN_07':'float','OFF_08':'float','ONN_08':'float','ONN_09':'float','OFF_09':'float','ONN_10':'float','OFF_10':'float','ATT_HR':'float','OTT_HR':'float','OVO_HR':'float','LAT_MN':'float','LAT_TM':'int','EAR_MN':'float','EAR_TM':'int','ABS_MN':'float','ABS_TM':'int','ATT_DY':'float','NIG_DY':'float','LOC_BT':'bit','LOC_B1':'bit','USR_CK':'nvarchar','NIG_HR':'float','DOF_HR':'float','DOF_OT':'float','DOF_OV':'float','HOL_HR':'float','HOL_OT':'float','HOL_OV':'float','NIG_OT':'float','NIG_OV':'float','LEA_I1':'nvarchar','LEA_H1':'float','LEA_I2':'nvarchar','LEA_H2':'float','LEA_I3':'nvarchar','LEA_H3':'float','OTR_HR':'float','FOR_TM':'int','LAT_T2':'int','EAR_T2':'int','LAT_M2':'float','EAR_M2':'float','FOR_T1':'int','OTT_TM':'int','OTT_MF':'float','SEQ_OT':'int','LAT_05':'int','LAT_15':'int','LAT_30':'int','LAT_60':'int','DON_OT':'float','HON_HR':'float','TRP_AM':'float','MEA_TM':'int','CAL_TM':'int','DOF_VV':'float','HOL_VV':'float','TIM_AD':'float','TIM_NM':'nvarchar','GPS_BT':'bit','NIG_TT':'int','BUU_HR':'float','ATT_HR1':'float','MOR_OT':'float','REM_D2':'nvarchar','DAY_TM':'float'};
  List<String> listFieldKeys=['EMP_ID','ATT_DT','SHI_ID'];
  List<String> listField=['EMP_ID','ATT_DT','DEP_ID','EMP_I1','SHI_ID','NOT_OR','NOT_DR','NOT_D1','NIG_TM','ONN_01','OFF_01','ONN_02','OFF_02','ONN_03','OFF_03','ONN_04','OFF_04','ONN_05','OFF_05','ONN_06','OFF_06','OFF_07','ONN_07','OFF_08','ONN_08','ONN_09','OFF_09','ONN_10','OFF_10','ATT_HR','OTT_HR','OVO_HR','LAT_MN','LAT_TM','EAR_MN','EAR_TM','ABS_MN','ABS_TM','ATT_DY','NIG_DY','LOC_BT','LOC_B1','USR_CK','NIG_HR','DOF_HR','DOF_OT','DOF_OV','HOL_HR','HOL_OT','HOL_OV','NIG_OT','NIG_OV','LEA_I1','LEA_H1','LEA_I2','LEA_H2','LEA_I3','LEA_H3','OTR_HR','FOR_TM','LAT_T2','EAR_T2','LAT_M2','EAR_M2','FOR_T1','OTT_TM','OTT_MF','SEQ_OT','LAT_05','LAT_15','LAT_30','LAT_60','DON_OT','HON_HR','TRP_AM','MEA_TM','CAL_TM','DOF_VV','HOL_VV','TIM_AD','TIM_NM','GPS_BT','NIG_TT','BUU_HR','ATT_HR1','MOR_OT','REM_D2','DAY_TM'];
}