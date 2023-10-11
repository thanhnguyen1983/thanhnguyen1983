class FILD03A
{
 String? COL_NM;
 String? SAL_NM;
 String? SAL_VL;

 FILD03A({this.COL_NM,this.SAL_NM,this.SAL_VL});
 factory FILD03A.fromJson(Map<String,dynamic> json)=>
     FILD03A(
      COL_NM: json['COL_NM'] ??'',
      SAL_NM: json['SAL_NM'] ??'',
      SAL_VL: json['SAL_VL'] ??'',
     );
 Map<String,dynamic> toJson()=>
     {
      'COL_NM': COL_NM ?? '',
      'SAL_NM': SAL_NM ?? '',
      'SAL_VL': SAL_VL ?? '',
     };
}