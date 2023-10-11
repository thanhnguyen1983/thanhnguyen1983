class FILD01A
{
  String? COL_NM;
  int? SEQ_NO;
  String? COL_EN;
  String? COL_VN;
  String? COL_CH;
  String? COL_TT;
  bool? HUR_BT;
  bool? ACC_BT;
  bool? BAS_BT;
  bool? QIN_BT;
  bool? LCK_BT;
  bool? HID_BT;
  bool? INI_BT;
  bool? ONT_BT;
  bool? SHO_BT;
  bool? LEV_BT;
  bool? SEL_BT;
  double? COL_VL;
  int?SEQ_MB;
  String?FormatString;
  bool? SHO_MB;

  FILD01A({this.COL_NM,this.SEQ_NO,this.COL_EN,this.COL_VN,this.COL_CH,this.COL_TT,this.HUR_BT,this.ACC_BT,this.BAS_BT,this.QIN_BT,this.LCK_BT,this.HID_BT,this.INI_BT,this.ONT_BT,this.SHO_BT,this.LEV_BT,this.SEL_BT,this.COL_VL,this.SEQ_MB,this.FormatString,this.SHO_MB});
  factory FILD01A.fromJson(Map<String,dynamic> json)=>
      FILD01A(
          COL_NM: json['COL_NM'] ??'',
          SEQ_NO: json['SEQ_NO'] as int,
          COL_EN: json['COL_EN'] ??'',
          COL_VN: json['COL_VN'] ??'',
          COL_CH: json['COL_CH'] ??'',
          COL_TT: json['COL_TT'] ??'',
          HUR_BT: json['HUR_BT'] as bool,
          ACC_BT: json['ACC_BT'] as bool,
          BAS_BT: json['BAS_BT'] as bool,
          QIN_BT: json['QIN_BT'] as bool,
          LCK_BT: json['LCK_BT'] as bool,
          HID_BT: json['HID_BT'] as bool,
          INI_BT: json['INI_BT'] as bool,
          ONT_BT: json['ONT_BT'] as bool,
          SHO_BT: json['SHO_BT'] as bool,
          LEV_BT: json['LEV_BT'] as bool,
          SEL_BT: json['SEL_BT'] as bool,
          COL_VL: json['COL_VL'] as double,
         SEQ_MB: json['SEQ_MB'] as int,
          FormatString:json['FormatString'] ??'',
          SHO_MB: json['SHO_MB'] as bool

      );
  Map<String,dynamic> toJson()=>{
    'COL_NM':COL_NM??'',
    'SEQ_NO':SEQ_NO??0,
    'COL_EN':COL_EN??'',
    'COL_VN':COL_VN??'',
    'COL_CH':COL_CH??'',
    'COL_TT':COL_TT??'',
    'HUR_BT':HUR_BT!?1:0,
    'ACC_BT':ACC_BT!?1:0,
    'BAS_BT':BAS_BT!?1:0,
    'QIN_BT':QIN_BT!?1:0,
    'LCK_BT':LCK_BT!?1:0,
    'HID_BT':HID_BT!?1:0,
    'INI_BT':INI_BT!?1:0,
    'ONT_BT':ONT_BT!?1:0,
    'SHO_BT':SHO_BT!?1:0,
    'LEV_BT':LEV_BT!?1:0,
    'SEL_BT':SEL_BT!?1:0,
    'COL_VL':COL_VL??0,
    'SEQ_MB':SEQ_MB??0,
    'FormatString':FormatString??'',
    'SHO_MB':SHO_MB!?1:0
  };}
