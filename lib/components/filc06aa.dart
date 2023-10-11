class FILC06AA
{
  String? EMP_ID;
  String? YYY_MM;
  int? SEQ_NO;
  String? NOT_DR;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  String? LEA_I1;
  double? LEA_H1;
  String? LEA_I2;
  double? LEA_H2;
  String? LEA_I3;
  double? LEA_H3;
  bool? LOC_B1;
  double? HOL_TT;
  double? ATT_HR;
  double? OTT_HR;
  double? OVO_HR;
  double? LAT_MN;
  int? LAT_TM;
  double? EAR_MN;
  int? EAR_TM;
  double? ABS_MN;
  int? ABS_TM;
  double? LEA_QT;
  double? ATT_DY;
  double? NIG_DY;
  double? NIG_HR;
  double? DOF_HR;
  double? DOF_OT;
  double? DOF_OV;
  double? HOL_HR;
  double? HOL_OT;
  double? HOL_OV;
  double? NIG_OT;
  double? NIG_OV;
  double? OTR_HR;
  double? LEA_001;
  double? LEA_002;
  double? LEA_003;
  double? LEA_004;
  double? LEA_005;
  double? LEA_006;
  double? LEA_007;
  double? LEA_008;
  double? LEA_009;
  double? LEA_010;
  double? LEA_011;
  double? LEA_012;
  double? LEA_013;
  double? LEA_014;
  double? LEA_015;
  double? LEA_016;
  double? LEA_017;
  double? LEA_018;
  double? LEA_019;
  double? LEA_020;
  double? LEA_021;
  String? DEP_I1;
  String? EMP_DW;
  double? BOS_AM;
  double? FIN_AM;
  bool? PRO_FG;
  double? FOR_TM;
  int? LAT_T2;
  int? EAR_T2;
  double? LAT_M2;
  double? EAR_M2;
  int? OTT_TM;
  double? LEA_022;
  int? SEQ_OT;
  int? LAT_05;
  int? LAT_15;
  int? LAT_30;
  int? LAT_60;
  double? DON_OT;
  double? HON_HR;
  double? LEA_023;
  double? TRP_AM;
  int? MEA_TM;
  int? CAL_TM;
  double? DOF_VV;
  double? HOL_VV;
  double? TIM_AD;
  int? NIG_TT;
  double? BUU_HR;
  double? LEA_024;
  double? ATT_HR1;
  double? MOR_OT;
  double? LEA_025;
  bool? MOB_FG;
  double? DAY_TM;

  FILC06AA({this.EMP_ID,this.YYY_MM,this.SEQ_NO,this.NOT_DR,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.LEA_I1,this.LEA_H1,this.LEA_I2,this.LEA_H2,this.LEA_I3,this.LEA_H3,this.LOC_B1,this.HOL_TT,this.ATT_HR,this.OTT_HR,this.OVO_HR,this.LAT_MN,this.LAT_TM,this.EAR_MN,this.EAR_TM,this.ABS_MN,this.ABS_TM,this.LEA_QT,this.ATT_DY,this.NIG_DY,this.NIG_HR,this.DOF_HR,this.DOF_OT,this.DOF_OV,this.HOL_HR,this.HOL_OT,this.HOL_OV,this.NIG_OT,this.NIG_OV,this.OTR_HR,this.LEA_001,this.LEA_002,this.LEA_003,this.LEA_004,this.LEA_005,this.LEA_006,this.LEA_007,this.LEA_008,this.LEA_009,this.LEA_010,this.LEA_011,this.LEA_012,this.LEA_013,this.LEA_014,this.LEA_015,this.LEA_016,this.LEA_017,this.LEA_018,this.LEA_019,this.LEA_020,this.LEA_021,this.DEP_I1,this.EMP_DW,this.BOS_AM,this.FIN_AM,this.PRO_FG,this.FOR_TM,this.LAT_T2,this.EAR_T2,this.LAT_M2,this.EAR_M2,this.OTT_TM,this.LEA_022,this.SEQ_OT,this.LAT_05,this.LAT_15,this.LAT_30,this.LAT_60,this.DON_OT,this.HON_HR,this.LEA_023,this.TRP_AM,this.MEA_TM,this.CAL_TM,this.DOF_VV,this.HOL_VV,this.TIM_AD,this.NIG_TT,this.BUU_HR,this.LEA_024,this.ATT_HR1,this.MOR_OT,this.LEA_025,this.MOB_FG,this.DAY_TM});
  factory FILC06AA.fromJson(Map<String,dynamic> json)=>
      FILC06AA(
          EMP_ID: json['EMP_ID'] ??'',
          YYY_MM: json['YYY_MM'] ??'',
          SEQ_NO:json['SEQ_NO']!=null? json['SEQ_NO'] as int:0,
          NOT_DR: json['NOT_DR'] ??'',
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          LST_NM: json['LST_NM'] ??'',
          LST_DT: json['LST_DT'] ??'',
          LEA_I1: json['LEA_I1'] ??'',
          LEA_H1:json['LEA_H1']!=null? json['LEA_H1'] as double:0.0,
          LEA_I2: json['LEA_I2'] ??'',
          LEA_H2:json['LEA_H2']!=null? json['LEA_H2'] as double:0.0,
          LEA_I3: json['LEA_I3'] ??'',
          LEA_H3:json['LEA_H3']!=null? json['LEA_H3'] as double:0.0,
          LOC_B1: json['LOC_B1'] as bool,
          HOL_TT:json['HOL_TT']!=null? json['HOL_TT'] as double:0.0,
          ATT_HR:json['ATT_HR']!=null? json['ATT_HR'] as double:0.0,
          OTT_HR:json['OTT_HR']!=null? json['OTT_HR'] as double:0.0,
          OVO_HR:json['OVO_HR']!=null? json['OVO_HR'] as double:0.0,
          LAT_MN:json['LAT_MN']!=null? json['LAT_MN'] as double:0.0,
          LAT_TM:json['LAT_TM']!=null? json['LAT_TM'] as int:0,
          EAR_MN:json['EAR_MN']!=null? json['EAR_MN'] as double:0.0,
          EAR_TM:json['EAR_TM']!=null? json['EAR_TM'] as int:0,
          ABS_MN:json['ABS_MN']!=null? json['ABS_MN'] as double:0.0,
          ABS_TM:json['ABS_TM']!=null? json['ABS_TM'] as int:0,
          LEA_QT:json['LEA_QT']!=null? json['LEA_QT'] as double:0.0,
          ATT_DY:json['ATT_DY']!=null? json['ATT_DY'] as double:0.0,
          NIG_DY:json['NIG_DY']!=null? json['NIG_DY'] as double:0.0,
          NIG_HR:json['NIG_HR']!=null? json['NIG_HR'] as double:0.0,
          DOF_HR:json['DOF_HR']!=null? json['DOF_HR'] as double:0.0,
          DOF_OT:json['DOF_OT']!=null? json['DOF_OT'] as double:0.0,
          DOF_OV:json['DOF_OV']!=null? json['DOF_OV'] as double:0.0,
          HOL_HR:json['HOL_HR']!=null? json['HOL_HR'] as double:0.0,
          HOL_OT:json['HOL_OT']!=null? json['HOL_OT'] as double:0.0,
          HOL_OV:json['HOL_OV']!=null? json['HOL_OV'] as double:0.0,
          NIG_OT:json['NIG_OT']!=null? json['NIG_OT'] as double:0.0,
          NIG_OV:json['NIG_OV']!=null? json['NIG_OV'] as double:0.0,
          OTR_HR:json['OTR_HR']!=null? json['OTR_HR'] as double:0.0,
          LEA_001:json['LEA_001']!=null? json['LEA_001'] as double:0.0,
          LEA_002:json['LEA_002']!=null? json['LEA_002'] as double:0.0,
          LEA_003:json['LEA_003']!=null? json['LEA_003'] as double:0.0,
          LEA_004:json['LEA_004']!=null? json['LEA_004'] as double:0.0,
          LEA_005:json['LEA_005']!=null? json['LEA_005'] as double:0.0,
          LEA_006:json['LEA_006']!=null? json['LEA_006'] as double:0.0,
          LEA_007:json['LEA_007']!=null? json['LEA_007'] as double:0.0,
          LEA_008:json['LEA_008']!=null? json['LEA_008'] as double:0.0,
          LEA_009:json['LEA_009']!=null? json['LEA_009'] as double:0.0,
          LEA_010:json['LEA_010']!=null? json['LEA_010'] as double:0.0,
          LEA_011:json['LEA_011']!=null? json['LEA_011'] as double:0.0,
          LEA_012:json['LEA_012']!=null? json['LEA_012'] as double:0.0,
          LEA_013:json['LEA_013']!=null? json['LEA_013'] as double:0.0,
          LEA_014:json['LEA_014']!=null? json['LEA_014'] as double:0.0,
          LEA_015:json['LEA_015']!=null? json['LEA_015'] as double:0.0,
          LEA_016:json['LEA_016']!=null? json['LEA_016'] as double:0.0,
          LEA_017:json['LEA_017']!=null? json['LEA_017'] as double:0.0,
          LEA_018:json['LEA_018']!=null? json['LEA_018'] as double:0.0,
          LEA_019:json['LEA_019']!=null? json['LEA_019'] as double:0.0,
          LEA_020:json['LEA_020']!=null? json['LEA_020'] as double:0.0,
          LEA_021:json['LEA_021']!=null? json['LEA_021'] as double:0.0,
          DEP_I1: json['DEP_I1'] ??'',
          EMP_DW: json['EMP_DW'] ??'',
          BOS_AM:json['BOS_AM']!=null? json['BOS_AM'] as double:0.0,
          FIN_AM:json['FIN_AM']!=null? json['FIN_AM'] as double:0.0,
          PRO_FG: json['PRO_FG'] as bool,
          FOR_TM:json['FOR_TM']!=null? json['FOR_TM'] as double:0.0,
          LAT_T2:json['LAT_T2']!=null? json['LAT_T2'] as int:0,
          EAR_T2:json['EAR_T2']!=null? json['EAR_T2'] as int:0,
          LAT_M2:json['LAT_M2']!=null? json['LAT_M2'] as double:0.0,
          EAR_M2:json['EAR_M2']!=null? json['EAR_M2'] as double:0.0,
          OTT_TM:json['OTT_TM']!=null? json['OTT_TM'] as int:0,
          LEA_022:json['LEA_022']!=null? json['LEA_022'] as double:0.0,
          SEQ_OT:json['SEQ_OT']!=null? json['SEQ_OT'] as int:0,
          LAT_05:json['LAT_05']!=null? json['LAT_05'] as int:0,
          LAT_15:json['LAT_15']!=null? json['LAT_15'] as int:0,
          LAT_30:json['LAT_30']!=null? json['LAT_30'] as int:0,
          LAT_60:json['LAT_60']!=null? json['LAT_60'] as int:0,
          DON_OT:json['DON_OT']!=null? json['DON_OT'] as double:0.0,
          HON_HR:json['HON_HR']!=null? json['HON_HR'] as double:0.0,
          LEA_023:json['LEA_023']!=null? json['LEA_023'] as double:0.0,
          TRP_AM:json['TRP_AM']!=null? json['TRP_AM'] as double:0.0,
          MEA_TM:json['MEA_TM']!=null? json['MEA_TM'] as int:0,
          CAL_TM:json['CAL_TM']!=null? json['CAL_TM'] as int:0,
          DOF_VV:json['DOF_VV']!=null? json['DOF_VV'] as double:0.0,
          HOL_VV:json['HOL_VV']!=null? json['HOL_VV'] as double:0.0,
          TIM_AD:json['TIM_AD']!=null? json['TIM_AD'] as double:0.0,
          NIG_TT:json['NIG_TT']!=null? json['NIG_TT'] as int:0,
          BUU_HR:json['BUU_HR']!=null? json['BUU_HR'] as double:0.0,
          LEA_024:json['LEA_024']!=null? json['LEA_024'] as double:0.0,
          ATT_HR1:json['ATT_HR1']!=null? json['ATT_HR1'] as double:0.0,
          MOR_OT:json['MOR_OT']!=null? json['MOR_OT'] as double:0.0,
          LEA_025:json['LEA_025']!=null? json['LEA_025'] as double:0.0,
          MOB_FG: json['MOB_FG'] as bool,
          DAY_TM:json['DAY_TM']!=null? json['DAY_TM'] as double:0.0
      );
  Map<String,dynamic> toJson()=>{
    'EMP_ID':EMP_ID??'',
    'YYY_MM':YYY_MM??'',
    'SEQ_NO':SEQ_NO??0,
    'NOT_DR':NOT_DR??'',
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'LST_NM':LST_NM??'',
    'LST_DT':LST_DT??'',
    'LEA_I1':LEA_I1??'',
    'LEA_H1':LEA_H1??0,
    'LEA_I2':LEA_I2??'',
    'LEA_H2':LEA_H2??0,
    'LEA_I3':LEA_I3??'',
    'LEA_H3':LEA_H3??0,
    'LOC_B1':LOC_B1!?1:0,
    'HOL_TT':HOL_TT??0,
    'ATT_HR':ATT_HR??0,
    'OTT_HR':OTT_HR??0,
    'OVO_HR':OVO_HR??0,
    'LAT_MN':LAT_MN??0,
    'LAT_TM':LAT_TM??0,
    'EAR_MN':EAR_MN??0,
    'EAR_TM':EAR_TM??0,
    'ABS_MN':ABS_MN??0,
    'ABS_TM':ABS_TM??0,
    'LEA_QT':LEA_QT??0,
    'ATT_DY':ATT_DY??0,
    'NIG_DY':NIG_DY??0,
    'NIG_HR':NIG_HR??0,
    'DOF_HR':DOF_HR??0,
    'DOF_OT':DOF_OT??0,
    'DOF_OV':DOF_OV??0,
    'HOL_HR':HOL_HR??0,
    'HOL_OT':HOL_OT??0,
    'HOL_OV':HOL_OV??0,
    'NIG_OT':NIG_OT??0,
    'NIG_OV':NIG_OV??0,
    'OTR_HR':OTR_HR??0,
    'LEA_001':LEA_001??0,
    'LEA_002':LEA_002??0,
    'LEA_003':LEA_003??0,
    'LEA_004':LEA_004??0,
    'LEA_005':LEA_005??0,
    'LEA_006':LEA_006??0,
    'LEA_007':LEA_007??0,
    'LEA_008':LEA_008??0,
    'LEA_009':LEA_009??0,
    'LEA_010':LEA_010??0,
    'LEA_011':LEA_011??0,
    'LEA_012':LEA_012??0,
    'LEA_013':LEA_013??0,
    'LEA_014':LEA_014??0,
    'LEA_015':LEA_015??0,
    'LEA_016':LEA_016??0,
    'LEA_017':LEA_017??0,
    'LEA_018':LEA_018??0,
    'LEA_019':LEA_019??0,
    'LEA_020':LEA_020??0,
    'LEA_021':LEA_021??0,
    'DEP_I1':DEP_I1??'',
    'EMP_DW':EMP_DW??'',
    'BOS_AM':BOS_AM??0,
    'FIN_AM':FIN_AM??0,
    'PRO_FG':PRO_FG!?1:0,
    'FOR_TM':FOR_TM??0,
    'LAT_T2':LAT_T2??0,
    'EAR_T2':EAR_T2??0,
    'LAT_M2':LAT_M2??0,
    'EAR_M2':EAR_M2??0,
    'OTT_TM':OTT_TM??0,
    'LEA_022':LEA_022??0,
    'SEQ_OT':SEQ_OT??0,
    'LAT_05':LAT_05??0,
    'LAT_15':LAT_15??0,
    'LAT_30':LAT_30??0,
    'LAT_60':LAT_60??0,
    'DON_OT':DON_OT??0,
    'HON_HR':HON_HR??0,
    'LEA_023':LEA_023??0,
    'TRP_AM':TRP_AM??0,
    'MEA_TM':MEA_TM??0,
    'CAL_TM':CAL_TM??0,
    'DOF_VV':DOF_VV??0,
    'HOL_VV':HOL_VV??0,
    'TIM_AD':TIM_AD??0,
    'NIG_TT':NIG_TT??0,
    'BUU_HR':BUU_HR??0,
    'LEA_024':LEA_024??0,
    'ATT_HR1':ATT_HR1??0,
    'MOR_OT':MOR_OT??0,
    'LEA_025':LEA_025??0,
    'MOB_FG':MOB_FG!?1:0,
    'DAY_TM':DAY_TM??0
  };
  Map<String, String> mapFields={'EMP_ID':'nvarchar','YYY_MM':'nvarchar','SEQ_NO':'int','NOT_DR':'nvarchar','BLT_NM':'nvarchar','BLT_DT':'datetime','LST_NM':'nvarchar','LST_DT':'datetime','LEA_I1':'nvarchar','LEA_H1':'float','LEA_I2':'nvarchar','LEA_H2':'float','LEA_I3':'nvarchar','LEA_H3':'float','LOC_B1':'bit','HOL_TT':'float','ATT_HR':'float','OTT_HR':'float','OVO_HR':'float','LAT_MN':'float','LAT_TM':'int','EAR_MN':'float','EAR_TM':'int','ABS_MN':'float','ABS_TM':'int','LEA_QT':'float','ATT_DY':'float','NIG_DY':'float','NIG_HR':'float','DOF_HR':'float','DOF_OT':'float','DOF_OV':'float','HOL_HR':'float','HOL_OT':'float','HOL_OV':'float','NIG_OT':'float','NIG_OV':'float','OTR_HR':'float','LEA_001':'float','LEA_002':'float','LEA_003':'float','LEA_004':'float','LEA_005':'float','LEA_006':'float','LEA_007':'float','LEA_008':'float','LEA_009':'float','LEA_010':'float','LEA_011':'float','LEA_012':'float','LEA_013':'float','LEA_014':'float','LEA_015':'float','LEA_016':'float','LEA_017':'float','LEA_018':'float','LEA_019':'float','LEA_020':'float','LEA_021':'float','DEP_I1':'nvarchar','EMP_DW':'nvarchar','BOS_AM':'float','FIN_AM':'float','PRO_FG':'bit','FOR_TM':'float','LAT_T2':'int','EAR_T2':'int','LAT_M2':'float','EAR_M2':'float','OTT_TM':'int','LEA_022':'float','SEQ_OT':'int','LAT_05':'int','LAT_15':'int','LAT_30':'int','LAT_60':'int','DON_OT':'float','HON_HR':'float','LEA_023':'float','TRP_AM':'float','MEA_TM':'int','CAL_TM':'int','DOF_VV':'float','HOL_VV':'float','TIM_AD':'float','NIG_TT':'int','BUU_HR':'float','LEA_024':'float','ATT_HR1':'float','MOR_OT':'float','LEA_025':'float','MOB_FG':'bit','DAY_TM':'float'};
  List<String> listFieldKeys=['EMP_ID','YYY_MM','SEQ_NO'];
  List<String> listField=['EMP_ID','YYY_MM','SEQ_NO','NOT_DR','BLT_NM','BLT_DT','LST_NM','LST_DT','LEA_I1','LEA_H1','LEA_I2','LEA_H2','LEA_I3','LEA_H3','LOC_B1','HOL_TT','ATT_HR','OTT_HR','OVO_HR','LAT_MN','LAT_TM','EAR_MN','EAR_TM','ABS_MN','ABS_TM','LEA_QT','ATT_DY','NIG_DY','NIG_HR','DOF_HR','DOF_OT','DOF_OV','HOL_HR','HOL_OT','HOL_OV','NIG_OT','NIG_OV','OTR_HR','LEA_001','LEA_002','LEA_003','LEA_004','LEA_005','LEA_006','LEA_007','LEA_008','LEA_009','LEA_010','LEA_011','LEA_012','LEA_013','LEA_014','LEA_015','LEA_016','LEA_017','LEA_018','LEA_019','LEA_020','LEA_021','DEP_I1','EMP_DW','BOS_AM','FIN_AM','PRO_FG','FOR_TM','LAT_T2','EAR_T2','LAT_M2','EAR_M2','OTT_TM','LEA_022','SEQ_OT','LAT_05','LAT_15','LAT_30','LAT_60','DON_OT','HON_HR','LEA_023','TRP_AM','MEA_TM','CAL_TM','DOF_VV','HOL_VV','TIM_AD','NIG_TT','BUU_HR','LEA_024','ATT_HR1','MOR_OT','LEA_025','MOB_FG','DAY_TM'];
}