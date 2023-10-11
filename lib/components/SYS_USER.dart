class SYSUSER
{
  String? USER_ID;
  String? USER_NAME;
  String? GROUP_ID;
  String?PASS;
  bool? GPS_FG;
  bool? USE_FG;
  String?STF_ID;
  int?SEQ_NO;

  SYSUSER({this.GROUP_ID,this.USER_ID,this.USER_NAME,this.GPS_FG,this.USE_FG,this.SEQ_NO,this.PASS,this.STF_ID});
  factory SYSUSER.fromJson(Map<String,dynamic> json)=>
      SYSUSER(
        USER_ID: json['USER_ID'] ??'',
        USER_NAME: json['USER_NAME'] ??'',
        GROUP_ID: json['GROUP_ID'] ??'',
        PASS: json['PASS'] ??'',
          GPS_FG: json['GPS_FG'] as bool,
          USE_FG: json['USE_FG'] as bool,
        STF_ID: json['STF_ID'] ??'',
        SEQ_NO: json['SEQ_NO'] as int,
      );
  Map<String,dynamic> toJson()=>{
    'USER_ID':USER_ID??'',
    'USER_NAME':USER_NAME??'',
    'GROUP_ID':GROUP_ID??'',
    'PASS':PASS??'',
    'GPS_FG':GPS_FG!?true:false,
    'USE_FG':USE_FG!?true:false,
    'STF_ID':STF_ID??'',
    'SEQ_NO':SEQ_NO!??0
  };
  Map<String, String> mapFields={'GROUP_ID':'nvarchar','USER_ID':'nvarchar','USER_NAME':'nvarchar','GPS_FG':'bit','USE_FG':'bit'};
  List<String> listFieldKeys=['USER_ID'];
  List<String> listField=['GROUP_ID','USER_ID','USER_NAME','GPS_FG','USE_FG'];
}