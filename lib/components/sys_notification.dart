class SYS_NOTIFICATION
{
  String? EMP_ID;
  String? SEQ_NO;
  String? TIT_DR;
  String? DES_DR;
  bool? RED_FG;
  String? SEQ_DT;

  SYS_NOTIFICATION({this.EMP_ID,this.SEQ_NO,this.TIT_DR,this.DES_DR,this.RED_FG,this.SEQ_DT});
  factory SYS_NOTIFICATION.fromJson(Map<String,dynamic> json)=>
      SYS_NOTIFICATION(
          EMP_ID: json['EMP_ID'] ??'',
          SEQ_NO: json['SEQ_NO'] ??'',
          TIT_DR: json['TIT_DR'] ??'',
          DES_DR: json['DES_DR'] ??'',
          RED_FG: json['RED_FG'] as bool,
          SEQ_DT: json['SEQ_DT'] ??''
      );
  Map<String,dynamic> toJson()=>{
    'EMP_ID':EMP_ID??'',
    'SEQ_NO':SEQ_NO??'',
    'TIT_DR':TIT_DR??'',
    'DES_DR':DES_DR??'',
    'RED_FG':RED_FG!?1:0,
    'SEQ_DT':SEQ_DT??''
  };}
