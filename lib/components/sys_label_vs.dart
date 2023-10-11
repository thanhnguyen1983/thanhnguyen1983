class SYS_LABEL_VS
{
  String? NAME;
  int? ID;
  String? EN;
  String? CH;
  String? VN;
  String? TT;
  String? FNAME;
  bool? HIDE;

  SYS_LABEL_VS({this.NAME,this.ID,this.EN,this.CH,this.VN,this.TT,this.FNAME,this.HIDE});
  factory SYS_LABEL_VS.fromJson(Map<String,dynamic> json)=>
      SYS_LABEL_VS(
          NAME: json['NAME'] ??'',
          ID: json['ID'] as int,
          EN: json['EN'] ??'',
          CH: json['CH'] ??'',
          VN: json['VN'] ??'',
          TT: json['TT'] ??'',
          FNAME: json['FNAME'] ??'',
        HIDE:json['HIDE'] as bool

      );
  Map<String,dynamic> toJson()=>{
    'NAME':NAME??'',
    'ID':ID??0,
    'EN':EN??'',
    'CH':CH??'',
    'VN':VN??'',
    'TT':TT??'',
    'FNAME':FNAME??'',
    'HIDE':HIDE!? true : false
  };}
