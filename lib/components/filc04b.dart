class FILC04B
{
  String? YYY_YY;
  String? EMP_ID;
  double? DID_QT;
  double? HAV_QT;
  double? ADD_QT;
  double? BOR_QT;
  double? SUP_QT;
  double? LST_QT;
  double? LST_Q1;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  double? CAN_QT;

  FILC04B({this.YYY_YY,this.EMP_ID,this.DID_QT,this.HAV_QT,this.ADD_QT,this.BOR_QT,this.SUP_QT,this.LST_QT,this.LST_Q1,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.CAN_QT});
  factory FILC04B.fromJson(Map<String,dynamic> json)=>
      FILC04B(
          YYY_YY: json['YYY_YY'] ??'',
          EMP_ID: json['EMP_ID'] ??'',
          DID_QT: json['DID_QT'] as double,
          HAV_QT: json['HAV_QT'] as double,
          ADD_QT: json['ADD_QT'] as double,
          BOR_QT: json['BOR_QT'] as double,
          SUP_QT: json['SUP_QT'] as double,
          LST_QT: json['LST_QT'] as double,
          LST_Q1: json['LST_Q1'] as double,
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          LST_NM: json['LST_NM'] ??'',
          LST_DT: json['LST_DT'] ??'',
          CAN_QT: json['CAN_QT'] as double
      );
  Map<String,dynamic> toJson()=>{
    'YYY_YY':YYY_YY??'',
    'EMP_ID':EMP_ID??'',
    'DID_QT':DID_QT??0,
    'HAV_QT':HAV_QT??0,
    'ADD_QT':ADD_QT??0,
    'BOR_QT':BOR_QT??0,
    'SUP_QT':SUP_QT??0,
    'LST_QT':LST_QT??0,
    'LST_Q1':LST_Q1??0,
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'LST_NM':LST_NM??'',
    'LST_DT':LST_DT??'',
    'CAN_QT':CAN_QT??0
  };}
