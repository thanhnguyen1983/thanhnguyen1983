class sbmfrmSecurity_vs
{
  String? COM_ID;
  String? GROUP_ID;
  String? GROUP_NM;
  int? SEQ_NO;

  sbmfrmSecurity_vs({this.COM_ID,this.GROUP_ID,this.GROUP_NM,this.SEQ_NO});
  factory sbmfrmSecurity_vs.fromJson(Map<String,dynamic> json)=>
      sbmfrmSecurity_vs(
          COM_ID: json['COM_ID'] ??'',
          GROUP_ID: json['GROUP_ID'] ??'',
          GROUP_NM: json['GROUP_NM'] ??'',
          SEQ_NO:json['SEQ_NO'] ??0
      );
  Map<String,dynamic> toJson()=>{
    'COM_ID':COM_ID??'',
    'GROUP_ID':GROUP_ID??'',
    'GROUP_NM':GROUP_NM??'',
    'SEQ_NO':SEQ_NO??0
  };
  Map<String, String> mapFields={'COM_ID':'nvarchar','GROUP_ID':'nvarchar','GROUP_NM':'nvarchar','SEQ_NO':'int'};
  List<String> listFieldKeys=['GROUP_ID'];
  List<String> listField=['COM_ID','GROUP_ID','GROUP_NM','SEQ_NO'];
}