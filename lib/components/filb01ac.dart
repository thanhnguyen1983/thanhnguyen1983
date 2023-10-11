class FILB01AC
{
  String? EMP_ID;
  String? VAC_ID;
  String? VAC_DT;
  String? NOT_DR;
  String? BLT_NM;
  String? BLT_DT;
  bool? VAT_BT;
  String? VAC_NO;

  FILB01AC({this.EMP_ID,this.VAC_ID,this.VAC_DT,this.NOT_DR,this.BLT_NM,this.BLT_DT,this.VAT_BT,this.VAC_NO});
  factory FILB01AC.fromJson(Map<String,dynamic> json)=>
      FILB01AC(
          EMP_ID: json['EMP_ID'] ??'',
          VAC_ID: json['VAC_ID'] ??'',
          VAC_DT: json['VAC_DT'] ??'',
          NOT_DR: json['NOT_DR'] ??'',
          BLT_NM: json['BLT_NM'] ??'',
          BLT_DT: json['BLT_DT'] ??'',
          VAT_BT: json['VAT_BT'] as bool,
          VAC_NO: json['VAC_NO'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'EMP_ID':EMP_ID??'',
    'VAC_ID':VAC_ID??'',
    'VAC_DT':VAC_DT??'',
    'NOT_DR':NOT_DR??'',
    'BLT_NM':BLT_NM??'',
    'BLT_DT':BLT_DT??'',
    'VAT_BT':VAT_BT!?1:0,
    'VAC_NO':VAC_NO??''
  };}