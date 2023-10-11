class FILC04A
{
  String? SEQ_NO;
  String? EMP_ID;
  String? STR_DT;
  String? END_DT;
  double? HOU_DY;
  int? STR_TM;
  int? END_TM;
  double? HOU_TT;
  String? LEA_ID;
  double? DAY_TT;
  bool? DAY_BT;
  String? NOT_DR;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  double? BOS_AM;
  bool? APV_FG;
  String? REM_DR;
  String? ACT_DR;
  bool? MEA_BT;
  String? SHI_ID;

  FILC04A({this.SEQ_NO,this.EMP_ID,this.STR_DT,this.END_DT,this.HOU_DY,this.STR_TM,this.END_TM,this.HOU_TT,this.LEA_ID,this.DAY_TT,this.DAY_BT,this.NOT_DR,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.BOS_AM,this.APV_FG,this.REM_DR,this.ACT_DR,this.MEA_BT,this.SHI_ID});
  factory FILC04A.fromJson(Map<String,dynamic> json)=>
      FILC04A(
          SEQ_NO: json['SEQ_NO'] ??'',
          EMP_ID: json['EMP_ID'] ??'',
          STR_DT: json['STR_DT'] ??'',
          END_DT: json['END_DT'] ??'',
          HOU_DY: json['HOU_DY'] as double,
          STR_TM: json['STR_TM'] as int,
          END_TM: json['END_TM'] as int,
          HOU_TT: json['HOU_TT'] as double,
          LEA_ID: json['LEA_ID'] ??'',
          DAY_TT: json['DAY_TT'] as double,
          DAY_BT: json['DAY_BT'] as bool,
          NOT_DR: json['NOT_DR'] ??'',
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          LST_NM: json['LST_NM'] ??'',
          LST_DT: json['LST_DT'] ??'',
          BOS_AM: json['BOS_AM'] as double,
          APV_FG: json['APV_FG'] as bool,
          REM_DR: json['REM_DR'] ??'',
          ACT_DR: json['ACT_DR'] ??'',
          MEA_BT: json['MEA_BT'] as bool,
          SHI_ID: json['SHI_ID'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'SEQ_NO':SEQ_NO??'',
    'EMP_ID':EMP_ID??'',
    'STR_DT':STR_DT??'',
    'END_DT':END_DT??'',
    'HOU_DY':HOU_DY??0,
    'STR_TM':STR_TM??0,
    'END_TM':END_TM??0,
    'HOU_TT':HOU_TT??0,
    'LEA_ID':LEA_ID??'',
    'DAY_TT':DAY_TT??0,
    'DAY_BT':DAY_BT!?1:0,
    'NOT_DR':NOT_DR??'',
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'LST_NM':LST_NM??'',
    'LST_DT':LST_DT??'',
    'BOS_AM':BOS_AM??0,
    'APV_FG':APV_FG!?1:0,
    'REM_DR':REM_DR??'',
    'ACT_DR':ACT_DR??'',
    'MEA_BT':MEA_BT!?1:0,
    'SHI_ID':SHI_ID??''
  };}
