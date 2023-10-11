class FILC02A
{
  String? SHI_ID;
  String? SHI_VN;
  double? MAX_HR;
  double? MIN_HR;
  double? CON_H1;
  double? ADD_H1;
  double? CON_H2;
  double? ADD_H2;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  bool? TIM_02;
  double? OFF_TM;
  String? COL_NO;
  String? SHI_EN;
  String? SHI_CH;
  bool? ODD_FG;
  String? DEP_ID;
  String? SHI_I1;

  FILC02A({this.SHI_ID,this.SHI_VN,this.MAX_HR,this.MIN_HR,this.CON_H1,this.ADD_H1,this.CON_H2,this.ADD_H2,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.TIM_02,this.OFF_TM,this.COL_NO,this.SHI_EN,this.SHI_CH,this.ODD_FG,this.DEP_ID,this.SHI_I1});
  factory FILC02A.fromJson(Map<String,dynamic> json)=>
      FILC02A(
          SHI_ID: json['SHI_ID'] ??'',
          SHI_VN: json['SHI_VN'] ??'',
          MAX_HR: json['MAX_HR'] as double,
          MIN_HR: json['MIN_HR'] as double,
          CON_H1: json['CON_H1'] as double,
          ADD_H1: json['ADD_H1'] as double,
          CON_H2: json['CON_H2'] as double,
          ADD_H2: json['ADD_H2'] as double,
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          LST_NM: json['LST_NM'] ??'',
          LST_DT: json['LST_DT'] ??'',
          TIM_02: json['TIM_02'] as bool,
          OFF_TM: json['OFF_TM'] as double,
          COL_NO: json['COL_NO'] ??'',
          SHI_EN: json['SHI_EN'] ??'',
          SHI_CH: json['SHI_CH'] ??'',
          ODD_FG: json['ODD_FG'] as bool,
          DEP_ID: json['DEP_ID'] ??'',
          SHI_I1: json['SHI_I1'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'SHI_ID':SHI_ID??'',
    'SHI_VN':SHI_VN??'',
    'MAX_HR':MAX_HR??0,
    'MIN_HR':MIN_HR??0,
    'CON_H1':CON_H1??0,
    'ADD_H1':ADD_H1??0,
    'CON_H2':CON_H2??0,
    'ADD_H2':ADD_H2??0,
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'LST_NM':LST_NM??'',
    'LST_DT':LST_DT??'',
    'TIM_02':TIM_02!?1:0,
    'OFF_TM':OFF_TM??0,
    'COL_NO':COL_NO??'',
    'SHI_EN':SHI_EN??'',
    'SHI_CH':SHI_CH??'',
    'ODD_FG':ODD_FG!?1:0,
    'DEP_ID':DEP_ID??'',
    'SHI_I1':SHI_I1??''
  };}
