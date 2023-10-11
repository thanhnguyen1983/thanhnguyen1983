class ObjectVacation
{
  String ?EMP_ID;
  String ?STR_DT;
  String ?END_DT;
  double ?STR_TM;
  double?END_TM;
  String ?LEA_ID;
  ObjectVacation({this.EMP_ID,this.STR_DT,this.END_DT,this.STR_TM,this.END_TM,this.LEA_ID});

  factory ObjectVacation.fromJson(Map<String,dynamic> json)=>
      ObjectVacation(
        EMP_ID: json['EMP_ID']??'',
        STR_DT: json['STR_DT']??'',
        END_DT: json['END_DT']??'',
        STR_TM: json['STR_TM'] as double,
        END_TM: json['END_TM'] as double,
        LEA_ID: json['LEA_ID'] ??''
      );
  Map<String,dynamic> toJson()=>
      {
        'EMP_ID':EMP_ID??'',
        'STR_DT':STR_DT??'',
        'END_DT':END_DT??'',
        'STR_TM':STR_TM??0,
        'END_TM':END_TM??0,
        'LEA_ID':LEA_ID??''
      };
}