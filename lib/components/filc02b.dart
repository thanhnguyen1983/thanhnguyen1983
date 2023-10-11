class FILC02B
{
  String? SHI_ID;
  int? SEQ_N1;
  double? SEQ_NO;
  double? ONN_T0;
  double? ONN_TM;
  String? ONN_RD;
  bool? ONN_BT;
  double? OFF_TM;
  String? OFF_RD;
  bool? OFF_BT;
  String? TYP_ID;
  double? MIN_ST;
  double? WRK_HR;
  bool? LAT_BT;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  double? MAN_IN;
  double? MAN_OU;
  bool? MOR_BT;
  bool? MOR_OT;
  double? ADD_H1;
  double? MAX_H1;
  double? MAX_H2;
  String? TYP_VN;
  String? TYP_CH;
  FILC02B({this.TYP_CH,this.TYP_VN,this.SHI_ID,this.SEQ_N1,this.SEQ_NO,this.ONN_T0,this.ONN_TM,this.ONN_RD,this.ONN_BT,this.OFF_TM,this.OFF_RD,this.OFF_BT,this.TYP_ID,this.MIN_ST,this.WRK_HR,this.LAT_BT,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.MAN_IN,this.MAN_OU,this.MOR_BT,this.MOR_OT,this.ADD_H1,this.MAX_H1,this.MAX_H2});
  factory FILC02B.fromJson(Map<String,dynamic> json)=>
      FILC02B(
          SHI_ID: json['SHI_ID'] ??'',
          SEQ_N1: json['SEQ_N1'] as int,
          SEQ_NO: json['SEQ_NO'] as double,
          ONN_T0: json['ONN_T0'] as double,
          ONN_TM: json['ONN_TM'] as double,
          ONN_RD: json['ONN_RD'] ??'',
          ONN_BT: json['ONN_BT'] as bool,
          OFF_TM: json['OFF_TM'] as double,
          OFF_RD: json['OFF_RD'] ??'',
          OFF_BT: json['OFF_BT'] as bool,
          TYP_ID: json['TYP_ID'] ??'',
          MIN_ST: json['MIN_ST'] as double,
          WRK_HR: json['WRK_HR'] as double,
          LAT_BT: json['LAT_BT'] as bool,
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          LST_NM: json['LST_NM'] ??'',
          LST_DT: json['LST_DT'] ??'',
          MAN_IN: json['MAN_IN'] as double,
          MAN_OU: json['MAN_OU'] as double,
          MOR_BT: json['MOR_BT'] as bool,
          MOR_OT: json['MOR_OT'] as bool,
          ADD_H1: json['ADD_H1'] as double,
          MAX_H1: json['MAX_H1'] as double,
          MAX_H2: json['MAX_H2'] as double,
          TYP_VN: json['TYP_VN'] ??'',
          TYP_CH: json['TYP_CH'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'SHI_ID':SHI_ID??'',
    'SEQ_N1':SEQ_N1??0,
    'SEQ_NO':SEQ_NO??0,
    'ONN_T0':ONN_T0??0,
    'ONN_TM':ONN_TM??0,
    'ONN_RD':ONN_RD??'',
    'ONN_BT':ONN_BT!?1:0,
    'OFF_TM':OFF_TM??0,
    'OFF_RD':OFF_RD??'',
    'OFF_BT':OFF_BT!?1:0,
    'TYP_ID':TYP_ID??'',
    'MIN_ST':MIN_ST??0,
    'WRK_HR':WRK_HR??0,
    'LAT_BT':LAT_BT!?1:0,
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'LST_NM':LST_NM??'',
    'LST_DT':LST_DT??'',
    'MAN_IN':MAN_IN??0,
    'MAN_OU':MAN_OU??0,
    'MOR_BT':MOR_BT!?1:0,
    'MOR_OT':MOR_OT!?1:0,
    'ADD_H1':ADD_H1??0,
    'MAX_H1':MAX_H1??0,
    'MAX_H2':MAX_H2??0,
    'TYP_VN':TYP_VN??'',
    'TYP_CH':TYP_CH??'',
  };
}
