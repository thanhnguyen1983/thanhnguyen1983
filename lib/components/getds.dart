class GetDS
{
  String? sselect;
  String? suser;
  String? sty;
  List<String>? listselect;
  GetDS( {this.sselect,this.suser,this.sty,this.listselect});
  Map<String,dynamic> toJson()=>
      {
        'sselect':sselect??'',
        'suser':suser??'',
        'sty':sty??'',
        'listselect':listselect??'[]'
      };
}