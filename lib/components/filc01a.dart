import 'dart:convert';
//List<FILC01A> FILC01AFromJson(String str)=> List<FILC01A>.from(json.decoder(str).map(x)=>FILC01A.FILC01A.fromJson(json));
List<FILC01A> FILC01AFromJson(String str) => List<FILC01A>.from(json.decode(str).map((x) => FILC01A.fromJson(x)));
class FILC01A{
   String? DAT_TM;
   String? EMP_ID;
   String? CRD_DT;
   String? CRD_TM;
   int? STR_DR;
   String? LAT_DR;
   String? LON_DR;
   String? ADD_DR;

  FILC01A({required this.DAT_TM,required this.EMP_ID,required this.CRD_DT,required this.CRD_TM,required this.STR_DR,required this.LAT_DR,required this.LON_DR,required this.ADD_DR});

  /*
  factory FILC01A.fromJson(Map<String,dynamic> json)
  {
    return FILC01A(
        STR_DR: json['STR_DR'] as int,
        DAT_TM: json['DAT_TM'] as String,
        EMP_ID:json['EMP_ID'] as String,
        CRD_DT: json['CRD_DT'] as String,
        CRD_TM:json['CRD_TM'] as String,
        LAT_DR:json['latitude'] as String,
        LON_DR:json['longitude'] as String,
        ADD_DR:json['address'] as String
    );
    */
  //}

  factory FILC01A.fromJson(Map<String,dynamic> json) => FILC01A(
      STR_DR: json['STR_DR'] as int,
      DAT_TM: json['DAT_TM'] as String,
      EMP_ID:json['EMP_ID'] as String,
      CRD_DT: json['CRD_DT'] as String,
      CRD_TM:json['CRD_TM'] as String,
      LAT_DR:json['latitude'] ??'',
      LON_DR:json['longitude'] ??'',
      ADD_DR:json['address'] ??'');

   Map<String, dynamic> toJson() =>{
     'DAT_TM':DAT_TM??'',
     'EMP_ID':EMP_ID??'',
     'CRD_DT':CRD_DT??'',
     'CRD_TM':CRD_TM??'',
     'STR_DR':STR_DR??'',
     'LAT_DR':LAT_DR??'',
     'LON_DR':LON_DR??'',
     'ADD_DR':ADD_DR??''
   };

}