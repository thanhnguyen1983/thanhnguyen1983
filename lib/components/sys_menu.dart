class SYS_MENU
{
  int? ID;
  int? H_ID;
  int? SEQ;
  bool? HIDE;
  String? EN;
  String? VN;
  String? CH;
  bool? SEC;
  String? TT;
  String? FRAME;
  bool? DEP_BT;
  bool? TYP_BT;
  bool? TRE_FG;
  String? COL_NO;
  double? SEQ_NO;
  String? COM_ID;

  SYS_MENU({this.ID,this.H_ID,this.SEQ,this.HIDE,this.EN,this.VN,this.CH,this.SEC,this.TT,this.FRAME,this.DEP_BT,this.TYP_BT,this.TRE_FG,this.COL_NO,this.SEQ_NO,this.COM_ID});
  factory SYS_MENU.fromJson(Map<String,dynamic> json)=>
      SYS_MENU(
          ID: json['ID'] as int,
          H_ID: json['H_ID'] as int,
          SEQ: json['SEQ'] as int,
          HIDE: json['HIDE'] as bool,
          EN: json['EN'] ??'',
          VN: json['VN'] ??'',
          CH: json['CH'] ??'',
          SEC: json['SEC'] as bool,
          TT: json['TT'] ??'',
          FRAME: json['FRAME'] ??'',
          DEP_BT: json['DEP_BT'] as bool,
          TYP_BT: json['TYP_BT'] as bool,
          TRE_FG: json['TRE_FG'] as bool,
          COL_NO: json['COL_NO'] ??'',
          SEQ_NO: json['SEQ_NO'] as double,
          COM_ID: json['COM_ID'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'ID':ID??0,
    'H_ID':H_ID??0,
    'SEQ':SEQ??0,
    'HIDE':HIDE!?1:0,
    'EN':EN??'',
    'VN':VN??'',
    'CH':CH??'',
    'SEC':SEC!?1:0,
    'TT':TT??'',
    'FRAME':FRAME??'',
    'DEP_BT':DEP_BT!?1:0,
    'TYP_BT':TYP_BT!?1:0,
    'TRE_FG':TRE_FG!?1:0,
    'COL_NO':COL_NO??'',
    'SEQ_NO':SEQ_NO??0,
    'COM_ID':COM_ID??''
  };
  Map<String, String> mapFields={'ID':'int','H_ID':'int','SEQ':'int','HIDE':'bit','EN':'nvarchar','VN':'nvarchar','CH':'nvarchar','SEC':'bit','TT':'nvarchar','FRAME':'nvarchar','DEP_BT':'bit','TYP_BT':'bit','TRE_FG':'bit','COL_NO':'nvarchar','SEQ_NO':'float','COM_ID':'nvarchar'};
  List<String> listFieldKeys=['ID'];
  List<String> listField=['ID','H_ID','SEQ','HIDE','EN','VN','CH','SEC','TT','FRAME','DEP_BT','TYP_BT','TRE_FG','COL_NO','SEQ_NO','COM_ID'];
}