class AvataObject
{
  String? avataname;
  String? base64;
  String? extension;
  AvataObject({this.avataname,this.base64,this.extension});
  factory AvataObject.fromJson(Map<String, dynamic> json)=>
      AvataObject(
          avataname:json['avataname'] ?? '',
        base64:json['base64'] ?? '',
        extension:json['extension'] ?? ''
      );
  Map<String, dynamic> toJson() =>
      {
        'avataname': avataname ?? '',
        'base64': base64 ?? '',
        'extension': extension ?? ''
      };

}