class SYS_SECURITY
{
  String? GROUP_ID;
  int?MNU_ID;
  String? MNU_NM;
  bool? ADD;
  bool? UPDATE;
  bool? DELETE;
  bool? USAGE;
  bool? PRINT;
  bool?APROVAL;
  int? SEQ_NO;
  int?H_ID;
  SYS_SECURITY({this.GROUP_ID,this.MNU_ID,this.MNU_NM,this.ADD,this.UPDATE,this.DELETE,this.USAGE,this.PRINT,this.APROVAL,this.SEQ_NO,this.H_ID});

  factory SYS_SECURITY.fromJson(Map<String,dynamic> json)=>
      SYS_SECURITY(
          GROUP_ID: json['GROUP_ID'] ??'',
          MNU_ID: json['MNU_ID'] ??0,
          MNU_NM: json['MNU_NM'] ??'',
          ADD: json['ADD'] as bool,
          UPDATE: json['UPDATE'] as bool,
          DELETE: json['DELETE'] as bool,
          USAGE: json['USAGE'] as bool,
          PRINT: json['PRINT'] as bool,
          APROVAL: json['APROVAL'] as bool,
          SEQ_NO:json['SEQ_NO'] ??0,
        H_ID: json['H_ID'] ??0,
      );
  Map<String,dynamic> toJson()=>{
    'GROUP_ID':GROUP_ID??'',
    'MNU_ID':MNU_ID??0,
    'MNU_NM':MNU_NM??'',
    'ADD':ADD!?1:0,
    'UPDATE':UPDATE!?1:0,
    'DELETE':DELETE!?1:0,
    'USAGE':USAGE!?1:0,
    'PRINT':PRINT!?1:0,
    'APROVAL':APROVAL!?1:0,
    'SEQ_NO':SEQ_NO??0,
    'H_ID':H_ID??0
  };

}