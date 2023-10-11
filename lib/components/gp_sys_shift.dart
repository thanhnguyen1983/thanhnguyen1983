class GP_SYS_SHIFT
{
  String? TYP_ID;
  String? TYP_NM;
  String? TYP_EN;
  String? TYP_CH;
  String? TYP_VN;
  String? TYP_TT;
  String? ROU_DR;
  bool? SHO_BT;
  int? MEA_QT;
  double? MIN_TM;
  int? SEQ_NO;
  bool? MEA_BT;
  bool? ODD_FG;
  double? RAT_QT;

  GP_SYS_SHIFT({this.TYP_ID,this.TYP_NM,this.TYP_EN,this.TYP_CH,this.TYP_VN,this.TYP_TT,this.ROU_DR,this.SHO_BT,this.MEA_QT,this.MIN_TM,this.SEQ_NO,this.MEA_BT,this.ODD_FG,this.RAT_QT});
  factory GP_SYS_SHIFT.fromJson(Map<String,dynamic> json)=>
      GP_SYS_SHIFT(
          TYP_ID: json['TYP_ID'] ??'',
          TYP_NM: json['TYP_NM'] ??'',
          TYP_EN: json['TYP_EN'] ??'',
          TYP_CH: json['TYP_CH'] ??'',
          TYP_VN: json['TYP_VN'] ??'',
          TYP_TT: json['TYP_TT'] ??'',
          ROU_DR: json['ROU_DR'] ??'',
          SHO_BT: json['SHO_BT'] as bool,
          MEA_QT: json['MEA_QT'] as int,
          MIN_TM: json['MIN_TM'] as double,
          SEQ_NO: json['SEQ_NO'] as int,
          MEA_BT: json['MEA_BT'] as bool,
          ODD_FG: json['ODD_FG'] as bool,
          RAT_QT: json['RAT_QT'] as double
      );
  Map<String,dynamic> toJson()=>{
    'TYP_ID':TYP_ID??'',
    'TYP_NM':TYP_NM??'',
    'TYP_EN':TYP_EN??'',
    'TYP_CH':TYP_CH??'',
    'TYP_VN':TYP_VN??'',
    'TYP_TT':TYP_TT??'',
    'ROU_DR':ROU_DR??'',
    'SHO_BT':SHO_BT!?1:0,
    'MEA_QT':MEA_QT??0,
    'MIN_TM':MIN_TM??0,
    'SEQ_NO':SEQ_NO??0,
    'MEA_BT':MEA_BT!?1:0,
    'ODD_FG':ODD_FG!?1:0,
    'RAT_QT':RAT_QT??0
  };}
