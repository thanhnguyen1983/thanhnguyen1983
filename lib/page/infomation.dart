import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/avataclass.dart';
import 'package:humanweb/components/sys_label_vs.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/sys_label_vscontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'dart:convert';
import 'package:http/src/response.dart' as response;
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as ftmlfile;
import 'package:path/path.dart' as PATH;
class Infomation extends StatefulWidget
{
  @override
  _InfomationState createState()=> _InfomationState(); 
}
class _InfomationState extends State<Infomation>
{

  File? _image;
  final _picker = ImagePicker();
  Filb01aController filb01aController =Get.find();
  SystemController systemController=Get.find();
  Sys_Label_VsController sys_label_vsController=Get.put(Sys_Label_VsController());
  var list;
  String? _base64;
  @override
  initState()  {

    super.initState();

    sys_label_vsController.fetchSYS_LABEL_VS('sbmPersonalStaffInfo_vs');

  }



  Widget returnAvata()
  {
    // Uint8List bytes = Base64Decoder().convert(_base64!);
    // return CircleAvatar(
    //   backgroundImage: bytes == null
    //       ? const NetworkImage(
    //       'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
    //       : Image.memory(bytes).image,
    //   //  :imageFromPreferences,
    //   radius: 50.0,
    // );
    // return Obx(() => CircleAvatar(
    //   radius: 50.0,
    //     backgroundImage:Image.network('${urlImage}${filb01aController.items[0].EMP_ID}.${filb01aController.items[0].extension}').image
    //  // backgroundImage: systemController.isLoading.isTrue ? const AssetImage("images/noavatar.jpg") : Image.memory(const Base64Decoder().convert(systemController.avata.value)).image,
    // ));
    return Obx(() => CircleAvatar(
        radius: 50.0,
        backgroundImage:systemController.avata.value!='avata'?  Image.memory(Base64Decoder().convert(systemController.avata.value)).image:Image.network('${urlImage}${filb01aController.items[0].EMP_ID}.${filb01aController.items[0].extension}').image
      //  backgroundImage: (systemController.isLoading.isTrue || systemController.avata.value.isEmpty) ? const AssetImage("images/noavatar.jpg") : Image.memory(const Base64Decoder().convert(systemController.avata.value)).image,
    ));
  }

  _asyncFileUpload(File image) async{
    //create multipart request for POST or PATCH method

    print(image.path);

    Uri apiUrl = Uri.parse(kApiurl+'Upload/user/PostUserImage');

    //add text fields
    final mimeTypeData =
    lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');
    var request = http.MultipartRequest("POST", apiUrl);



    request.fields["EMP_ID"] = filb01aController.items[0].EMP_ID!;


    //create multipart using filepath, string or bytes
    //var pic = await http.MultipartFile.fromPath("half_body_image", image.path,contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    var pic=await http.MultipartFile.fromBytes('half_body_image', image.readAsBytesSync(),contentType:MediaType(mimeTypeData[0], mimeTypeData[1]));
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
  }

  Future<MediaInfo> pickImage() async {
    MediaInfo? mediaInfo = await ImagePickerWeb.getImageInfo;





    Uri apiUrl = Uri.parse(kApiurl+'Upload/user/PostUserImage');
    var request = http.MultipartRequest("POST", apiUrl);
    request.fields["EMP_ID"] = filb01aController.items[0].EMP_ID!;
    request.fields["base64"] = mediaInfo!.base64!;
    // var pic=await http.MultipartFile.fromString('half_body_image', mediaInfo.base64!,contentType:MediaType('image', 'jpeg'));

    // http.MultipartFile.fromString(field, value)
    //add multipart to request
    // request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    if(response.statusCode==200) {

    }

    return mediaInfo;


  }


  String returnLabel(String Fname)
  {
    String s='';

    for(var item in sys_label_vsController.items)
      {
       if(item.FNAME==Fname)
         {
           if(LanguageService.defaultLanguage=='vn') {
             s=item.VN!;
           } else {
             s=item.CH!;
           }
         }
      }
    return s;

  }
  loadImageFromStore ()async
  {

    response.Response res= await get(Uri.parse('${kApiurl}Upload/ImageAPI/GetFiles?EMP_ID=${filb01aController.items[0].EMP_ID}'));
    print('${kApiurl}Upload/ImageAPI/GetFiles?EMP_ID=${filb01aController.items[0].EMP_ID}');
    print (res.statusCode);
    if (res.statusCode == 200)
    {



      setState(() {

        _base64 = res.body.substring(1);
        _base64 = _base64!.substring(0,_base64!.length-1);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    if(filb01aController.items.isEmpty) {
      return Container();
    }
   return Container(
     width: screenWidth,
     height: screenHeight,
    child: Column(
    children: [
      Container(
        height: 150,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.blueAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)) ),
        child:    Container(
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[

                  returnAvata(),
                  InkWell(
                    onTap: _onAlertPress,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.black),
                        margin: const EdgeInsets.only(left: 70, top: 70),
                        child: const Icon(
                          Icons.photo_camera,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Text(filb01aController.items[0].EMP_ID!,
                  style:const  TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              Text(filb01aController.items[0].EMP_NM!,
                  style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      Expanded(child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child:Obx(() => sys_label_vsController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Table(
              columnWidths: const {0:FixedColumnWidth(100)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: const TableBorder(horizontalInside: BorderSide(width: 1,color: Colors.blue,style: BorderStyle.solid)),
              children: createRowNew(),
            ),
          )
          )
          ,
        ),
      ))
    ],
  ),
   );
  }
  //========================= Gellary / Camera AlerBox
  void _onAlertPress() async {

    getMultipleImageInfos();
    // pickImage();
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return CupertinoAlertDialog(
    //         actions: [
    //           CupertinoDialogAction(
    //             isDefaultAction: true,
    //             child: Column(
    //               children: <Widget>[
    //                 Image.asset(
    //                   'images/gallery.png',
    //                   width: 50,
    //                 ),
    //                 const Text('Gallery'),
    //               ],
    //             ),
    //             onPressed: getGalleryImage,
    //           ),
    //           CupertinoDialogAction(
    //             isDefaultAction: true,
    //             child: Column(
    //               children: <Widget>[
    //                 Image.asset(
    //                   'images/take.png',
    //                   width: 50,
    //                 ),
    //                 const Text('Take Photo'),
    //               ],
    //             ),
    //             onPressed: getCameraImage,
    //           ),
    //         ],
    //       );
    //     });
  }
  late File _storedImage;
  // ================================= Image from camera
/*
  Future getCameraImage() async {

    PickedFile? image=await _picker.getImage(source: ImageSource.camera);
    _image = File(image!.path);// image;


   // _image_old=_image;
    final Directory extDir = await getApplicationDocumentsDirectory();
    String dirPath = extDir.path;
    String filePath = '$dirPath/c${filb01aController.items[0].EMP_ID!.trim()}.png';

    // copy the file to a new path
    File newImage = await _image!.copy(filePath);
    // sharedPreferences!.setString("avata${categorycontroller.getMaxCategory()}", newImage.path);
    setState(() {
      _image = newImage;
      Get.back();
      //Navigator.pop(context);
    });


  }

  //============================== Image from gallery
  Future getGalleryImage() async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);

    _image = File(image!.path);// image;
    final Directory extDir = await getApplicationDocumentsDirectory();
    String dirPath = extDir.path;
    String filePath = '$dirPath/c${filb01aController.items[0].EMP_ID!.trim()}.png';
    File newImage = await _image!.copy(filePath);
    setState(() async {

    //  _image_old=_image;
      _image=newImage;

// copy the file to a new path

      Get.back();
    });
  }

*/

  List<TableRow> createRow()
  {
    List<TableRow> itemList=[];


    filb01aController.items[0].toJson().forEach((key, value) {

      TableRow r;

      if(key=="DEP_ID")
        {
          r=TableRow(
              children: [
                textLbel(returnLabel(key),FontWeight.normal),
                LanguageService.defaultLanguage=='vn' ? textLbel(filb01aController.items[0].DEP_VN! ,FontWeight.bold):textLbel(filb01aController.items[0].DEP_CH! ,FontWeight.bold),
              ]
          );
        }
      else if(key=="POS_ID")
      {
        r=TableRow(
            children: [
              textLbel(returnLabel(key),FontWeight.normal),
              LanguageService.defaultLanguage=='vn' ? textLbel(filb01aController.items[0].POS_VN! ,FontWeight.bold):textLbel(filb01aController.items[0].POS_CH! ,FontWeight.bold),
            ]
        );
      }
      else if(key=="TYP_ID")
      {
        r=TableRow(
            children: [
              textLbel(returnLabel(key),FontWeight.normal),
              LanguageService.defaultLanguage=='vn' ? textLbel(filb01aController.items[0].TYP_VN! ,FontWeight.bold):textLbel(filb01aController.items[0].TYP_CH! ,FontWeight.bold),
            ]
        );
      }
    else {
        r = TableRow(
            children: [
              textLbel("${returnLabel(key)}", FontWeight.normal),
              value.runtimeType == bool ? customCheckBox(value) : textLbel(
                  '$value', FontWeight.bold),
            ]
        );
      }
      itemList.add(r);
    });

    return itemList;
  }
  List<TableRow> createRowNew()
  {
    List<TableRow> itemList=[];
    //sys_label_vsController.items[0].
    for(int i=0 ;i<sys_label_vsController.items.length;i++) {
      if (sys_label_vsController.items[i].HIDE == false) {
        filb01aController.items[0].toJson().forEach((key, value) {
          TableRow r;
          if (key == "DEP_ID" &&
              sys_label_vsController.items[i].FNAME == "DEP_ID") {
            r = TableRow(
                children: [
                  textLbel(LanguageService.defaultLanguage == 'vn'
                      ? sys_label_vsController.items[i].VN!
                      : sys_label_vsController.items[i].CH!, FontWeight.normal),
                  LanguageService.defaultLanguage == 'vn'
                      ? textLbel(
                      filb01aController.items[0].DEP_VN!, FontWeight.bold)
                      : textLbel(
                      filb01aController.items[0].DEP_CH!, FontWeight.bold),
                ]
            );
            itemList.add(r);
          }
          else if (key == "POS_ID" &&
              sys_label_vsController.items[i].FNAME == "POS_ID") {
            r = TableRow(
                children: [
                  textLbel(LanguageService.defaultLanguage == 'vn'
                      ? sys_label_vsController.items[i].VN!
                      : sys_label_vsController.items[i].CH!, FontWeight.normal),
                  LanguageService.defaultLanguage == 'vn'
                      ? textLbel(
                      filb01aController.items[0].POS_VN!, FontWeight.bold)
                      : textLbel(
                      filb01aController.items[0].POS_CH!, FontWeight.bold),
                ]
            );
            itemList.add(r);
          }
          else if (key == "TYP_ID" &&
              sys_label_vsController.items[i].FNAME == "TYP_ID") {
            r = TableRow(
                children: [
                  textLbel(LanguageService.defaultLanguage == 'vn'
                      ? sys_label_vsController.items[i].VN!
                      : sys_label_vsController.items[i].CH!, FontWeight.normal),
                  LanguageService.defaultLanguage == 'vn'
                      ? textLbel(
                      filb01aController.items[0].TYP_VN!, FontWeight.bold)
                      : textLbel(
                      filb01aController.items[0].TYP_CH!, FontWeight.bold),
                ]
            );
            itemList.add(r);
          }
          else {
            if (key == sys_label_vsController.items[i].FNAME &&
                (key != "DEP_ID" || key != "POS_ID" || key != "TYP_ID")) {
              r = TableRow(
                  children: [
                    textLbel(LanguageService.defaultLanguage == 'vn'
                        ? sys_label_vsController.items[i].VN!
                        : sys_label_vsController.items[i].CH!,
                        FontWeight.normal),
                    value.runtimeType == bool
                        ? customCheckBox(value)
                        : textLbel(
                        '$value', FontWeight.bold),
                  ]
              );
              itemList.add(r);
            }
          }
        });
      }
    }

        return itemList;
  }



  Widget textLbel(String value,FontWeight fw)
  {
    return Container(padding: const EdgeInsets.all(5),child: Text(value,maxLines: 2,style:TextStyle(fontWeight: fw)));
  }

  customCheckBox(bool value)
  {
    return Container(
      //decoration:const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: value ? const Icon(Icons.check,size:15.0,color: Colors.black,):const Icon(Icons.check_box_outline_blank,size: 15.0,color: Colors.black,),
      ),

    );
  }

  Future<void> getMultipleImageInfos() async
  {

    var mediaData = await ImagePickerWeb.getImageInfo;
    String mimeType = mime(PATH.basename(mediaData!.fileName!))!;

    AvataObject avataObject=AvataObject(avataname:filb01aController.items[0].EMP_ID,base64:mediaData.base64,extension:mimeType.split('/')[1]);
    var response1 = await post(Uri.parse('${kApiurl}Upload'),
        headers: <String, String>{
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + systemController.token.value
        },
        body: jsonEncode(avataObject)

    );
    if(response1.statusCode==200)
      {
        systemController.avata.value=mediaData.base64!;
        filb01aController.items[0].extension=mimeType.split('/')[1];
      }
  }
}

