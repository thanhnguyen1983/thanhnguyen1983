class SYS_GROUP_DEP
{
  String? DEP_NM;
  String? COM_ID;
  String? GROUP_ID;
  String? DEP_ID;
  bool? APV_FG;
  int?SEQ_NO;

  SYS_GROUP_DEP({this.DEP_NM,this.COM_ID,this.GROUP_ID,this.DEP_ID,this.APV_FG,this.SEQ_NO});
  factory SYS_GROUP_DEP.fromJson(Map<String,dynamic> json)=>
      SYS_GROUP_DEP(
          DEP_NM: json['DEP_NM'] ??'',
          COM_ID: json['COM_ID'] ??'',
          GROUP_ID: json['GROUP_ID'] ??'',
          DEP_ID: json['DEP_ID'] ??'',
          APV_FG: json['APV_FG'] as bool,
          SEQ_NO: json['SEQ_NO'] as int,
      );
  Map<String,dynamic> toJson()=>{
    'DEP_NM':DEP_NM??'',
    'COM_ID':COM_ID??'',
    'GROUP_ID':GROUP_ID??'',
    'DEP_ID':DEP_ID??'',
    'APV_FG':APV_FG!?1:0,
    'SEQ_NO':SEQ_NO??0
  };
  Map<String, String> mapFields={'DEP_NM':'nvarchar','COM_ID':'int','GROUP_ID':'nvarchar','DEP_ID':'nvarchar','APV_FG':'bit'};
  List<String> listFieldKeys=['GROUP_ID','DEP_ID'];
  List<String> listField=['GROUP_ID','DEP_ID','APV_FG'];
}