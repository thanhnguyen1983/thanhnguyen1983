class FILC04AA
{
  String? SEQ_NO;
  String? EMP_ID;
  String? EMP_NM;
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
  bool? APV_N1;
  bool? APV_N2;
  bool? APV_N3;
  bool? DIS_FG;
  String? REF_ID;
  String? REF_I2;
  String? REF_I3;

  FILC04AA({this.DIS_FG,this.SEQ_NO,this.EMP_ID,this.EMP_NM,this.STR_DT,this.END_DT,this.HOU_DY,this.STR_TM,this.END_TM,this.HOU_TT,this.LEA_ID,this.DAY_TT,this.DAY_BT,this.NOT_DR,this.BLT_NM,this.BLT_DT,this.LST_NM,this.LST_DT,this.BOS_AM,this.APV_FG,this.REM_DR,this.ACT_DR,this.MEA_BT,this.SHI_ID,this.APV_N1,this.APV_N2,this.APV_N3,this.REF_ID,this.REF_I2,this.REF_I3});
  factory FILC04AA.fromJson(Map<String,dynamic> json)=>
      FILC04AA(
          SEQ_NO: json['SEQ_NO'] ??'',
          EMP_ID: json['EMP_ID'] ??'',
          EMP_NM: json['EMP_NM'] ??'',
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
          MEA_BT: false,
          SHI_ID: json['SHI_ID'] ??'',
        APV_N1: json['APV_N1'] as bool,
        APV_N2: json['APV_N2'] as bool,
        APV_N3: json['APV_N3'] as bool,
        REF_ID: json['REF_ID'] ??'',
        REF_I2: json['REF_I2'] ??'',
        REF_I3: json['REF_I3'] ??'',
        DIS_FG: json['DIS_FG'] as bool,
      );
  Map<String,dynamic> toJson()=>{
    'SEQ_NO':SEQ_NO??'',
    'EMP_ID':EMP_ID??'',
    'EMP_NM':EMP_NM??'',
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
    'SHI_ID':SHI_ID??'',
    'APV_N1':APV_N1!?1:0,
    'APV_N2':APV_N2!?1:0,
    'APV_N3':APV_N3!?1:0,
    'REF_ID':REF_ID??'',
    'REF_I2':REF_I2??'',
    'REF_I3':REF_I3??'',
    'DIS_FG':DIS_FG!?1:0
  };}
