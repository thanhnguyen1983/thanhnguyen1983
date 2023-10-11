import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:humanweb/components/avataclass.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:humanweb/state/filc02acontroller.dart';
import 'package:humanweb/state/filc02bcontroller.dart';
import 'package:humanweb/state/filc03acontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:humanweb/view/viewattendance.dart';
import 'package:humanweb/view/viewattendancebyday.dart';
import 'package:humanweb/view/viewattendancemonth.dart';
import 'package:humanweb/view/viewpayrollXML.dart';
import 'package:humanweb/view/viewpayrollmonth.dart';
import 'package:humanweb/view/viewshiftofmonth.dart';
import 'package:humanweb/view/viewvacation.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import '../view/ViewAttendanceMonthNew.dart';
import '../view/viewpayroll.dart';
import 'attendance.dart';
import 'login_screen.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:html' as ftmlfile;
import 'package:path/path.dart' as PATH;

import 'dart:convert';
import 'package:http/src/response.dart' as response;
import 'package:image_picker_web/image_picker_web.dart';
class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>
{

  Filb01aController filb01aController =Get.find();
  Filc01aController filc01aController=Get.find();
  Filc03aController filc03aController=Get.find();
  SystemController systemController=Get.put(SystemController());
  Filc02aController filc02aController=Get.put(Filc02aController());
  Filc02bController filc02bController=Get.put(Filc02bController());



  var items=[LanguageService.MNU_01,LanguageService.MNU_02,LanguageService.MNU_03,LanguageService.MNU_04,LanguageService.MNU_05,LanguageService.MNU_06,LanguageService.MNU_07];
  File? _image;
  File? _image_old;
  final _picker = ImagePicker();

  String? _base64;
  //Uint8List? avata;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loadImageFromStore ();

  }

  @override
  Widget build(BuildContext context){
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;




     if(filb01aController.items.isEmpty) {

      Get.to(()=> const LoginScreen());
     }


    // TODO: implement build
   return Container(
     width: screenWidth,
     height: screenHeight,
     child: Column(
       children: [
         Container(
           height: 150,
           decoration: const BoxDecoration(
               gradient: LinearGradient(
               colors: [Colors.redAccent, Colors.blueAccent],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight),
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
         const SizedBox(height:3),
         Expanded(

          child: GridView.builder(
                padding: const EdgeInsets.only(left: 5,right: 5),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
                  childAspectRatio: 7/4,   //3/2
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, index){
                return InkWell(
                  onTap: (){
                    switch(index)
                    {
                      case 0:
                        filc01aController.isLoading(true);
                        filc01aController.fetchProducts();
                        Get.to(()=> ViewAttendance());
                        break;
                      case 1:
                        if(filb01aController.items[0].EMP_ID==systemController.username.toString()) {
                          Get.to(() => ViewVacation());
                        }else
                          {
                            SmartDialog.show(builder: (_){
                              return Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                alignment: Alignment.center,
                                child: Text(LanguageService.modify,style: TextStyle(color: Colors.white),),
                              );
                            });
                          }
                        break;
                      case 2:

                        Get.to(()=> ViewShiftofMonth());
                        break;
                      case 3:
                        Get.to(()=>ViewAttendanceByDay());
                        break;
                        case 4:
                         // Get.to(()=>ViewAttendanceMonth());
                          Get.to(()=>ViewAttendanceMonthNew());
                      break;
                      case 5:
                       // Get.to(() => ViewPayrollXML());
                        if(filb01aController.items[0].EMP_ID==systemController.username.toString()) {
                          //Get.to(() => ViewPayrollMonth());
                          Get.to(() => ViewPayrollXML());
                        }else
                          {
                            SmartDialog.show(builder: (_){
                              return Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                alignment: Alignment.center,
                                child: Text(LanguageService.cannotaccess,style: const TextStyle(color: Colors.white),),
                              );
                            });
                          }

                        break;
                      case 6:
                        if(filb01aController.items[0].EMP_ID==systemController.username.toString()) {
                          Get.to(() => ViewPayroll());
                        }else
                          {
                            SmartDialog.show(builder: (_){
                              return Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                alignment: Alignment.center,
                                child: Text(LanguageService.cannotaccess,style: TextStyle(color: Colors.white),),
                              );
                            });
                          }
                        break;
                    }
                  },
                  child: Container(
                      padding:const EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    child: Column(

                        children:<Widget>[
                          Image(image: AssetImage('images/item${index+1}.png'),width: 70,height: 70,),
                          Text(items[index],style: const TextStyle( fontWeight: FontWeight.bold,fontSize: 16),),
                        ]),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                );
              }
          ),
        )
       ],
     ),
   );
  }

  //========================= Gellary / Camera AlerBox

  void _onAlertPress() async {
    getMultipleImageInfos();
    //_saveImage();
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
    //            onPressed: getGalleryImage,
    //
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
  // Future getCameraImage() async {
  //
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera ,
  //   );
  //
  //
  //   // _image_old=_image;
  //   // final Directory extDir = await getApplicationDocumentsDirectory();
  //   // String dirPath = extDir.path;
  //   // String filePath = '$dirPath/c${filb01aController.items[0].EMP_ID!.trim()}.png';
  //   //
  //   //   // copy the file to a new path
  //   // File newImage = await _image!.copy(filePath);
  //
  //   setState(() {
  //     _image = File(pickedFile!.path);
  //     _asyncFileUpload(_image!);
  //     Get.back();
  //
  //   });
  //
  //
  // }
  //
  // //============================== Image from gallery
  // Future getGalleryImage() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery ,
  //   );
  //
  //
  //   // _image_old=_image;
  //   // final Directory extDir = await getApplicationDocumentsDirectory();
  //   // String dirPath = extDir.path;
  //   // String filePath = '$dirPath/c${filb01aController.items[0].EMP_ID!.trim()}.png';
  //   //
  //   //   // copy the file to a new path
  //   // File newImage = await _image!.copy(filePath);
  //
  //   setState(() {
  //     _image = File(pickedFile!.path);
  //     _asyncFileUpload(_image!);
  //     Get.back();
  //
  //   });
  // }

  loadImageFromStore ()async
  {

    // response.Response res= await get(Uri.parse('${kApiurl}Upload/ImageAPI/GetFiles?EMP_ID=${filb01aController.items[0].EMP_ID}'));
    // print('${kApiurl}Upload/ImageAPI/GetFiles?EMP_ID=${filb01aController.items[0].EMP_ID}');
    // print (res.statusCode);
    // if (res.statusCode == 200)
    //   {
    //
    //
    //
    //     setState(() {
    //
    //       _base64 = res.body.substring(1);
    //       _base64 = _base64!.substring(0,_base64!.length-1);
    //     });
    //   }
    //systemController.fetchProducts();
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

    return Obx(() => CircleAvatar(
      radius: 50.0,
        backgroundImage:systemController.avata.value!='avata'?  Image.memory(Base64Decoder().convert(systemController.avata.value)).image:Image.network('${urlImage}${filb01aController.items[0].EMP_ID}.${filb01aController.items[0].extension}').image
    //  backgroundImage: (systemController.isLoading.isTrue || systemController.avata.value.isEmpty) ? const AssetImage("images/noavatar.jpg") : Image.memory(const Base64Decoder().convert(systemController.avata.value)).image,
    ));

  }

  // _asyncFileUpload(File image) async{
  //   //create multipart request for POST or PATCH method
  //
  //   print(image.path);
  //
  //   Uri apiUrl = Uri.parse(kApiurl+'Upload/user/PostUserImage');
  //
  //   //add text fields
  //   final mimeTypeData =
  //   lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');
  //   var request = http.MultipartRequest("POST", apiUrl);
  //
  //
  //
  //   request.fields["EMP_ID"] = filb01aController.items[0].EMP_ID!;
  //
  //
  //   //create multipart using filepath, string or bytes
  //   //var pic = await http.MultipartFile.fromPath("half_body_image", image.path,contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
  //   var pic=await http.MultipartFile.fromBytes('half_body_image', image.readAsBytesSync(),contentType:MediaType(mimeTypeData[0], mimeTypeData[1]));
  //   //add multipart to request
  //   request.files.add(pic);
  //   var response = await request.send();
  //   //Get the response from the server
  //   var responseData = await response.stream.toBytes();
  //   var responseString = String.fromCharCodes(responseData);
  //
  //   if(response.statusCode==200) {
  //
  //   }
  // }
  // var _fileBytes;
  // Image? _imageWidget;
  // Future<void> pickImage() async {
  //   var mediaData = await ImagePickerWeb.getImageInfo;
  //   String mimeType = mime(Path.basename(mediaData.fileName));
  //   html.File mediaFile =
  //   new html.File(mediaData.data, mediaData.fileName, {'type': mimeType});
  //   if (mediaFile != null) {
  //     setState(() {
  //       _cloudFile = mediaFile;
  //       _fileBytes = mediaData.data;
  //       _imageWidget = Image.memory(mediaData.data);
  //     });
  //   }
  //
  //
  //
  //  //  Uri apiUrl = Uri.parse(kApiurl+'Upload?EMP_ID=${filb01aController.items[0].EMP_ID}');
  //  //  var request = http.MultipartRequest("POST", apiUrl);
  //  //
  //  //  var pic=await http.MultipartFile.fromString('half_body_image', mediaInfo.base64!,contentType:MediaType('image', 'jpeg'));
  //  //
  //  // // http.MultipartFile.fromString(field, value)
  //  //  //add multipart to request
  //  //  request.files.add(pic);
  //  //  var response = await request.send();
  //  //  //Get the response from the server
  //  //  var responseData = await response.stream.toBytes();
  //  //  var responseString = String.fromCharCodes(responseData);
  //  //  if(response.statusCode==200) {
  //  //   // systemController.avata.value=mediaInfo.base64!;
  //  //    print(responseString);
  //  //  }else
  //  //    {
  //  //      print(responseString);
  //  //    }
  //  //  return mediaInfo;
  // }



  /////////////////////////////
  _saveImage() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);

    if(result!.files.single.bytes!=null)
      {

        Uint8List? uploadfile = result.files.single.bytes;


       // File file = File(result.files.single.path);
      //  print(result.files.single.path);

        Uri apiUrl = Uri.parse(kApiurl+'Upload?EMP_ID=${filb01aController.items[0].EMP_ID}');
       // final mimeTypeData = lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])!.split('/');
        var request = http.MultipartRequest("POST", apiUrl);
        var headers={"Content-Type":"multipart/form-data"};
        request.headers.addAll(headers);

        //var pic = await http.MultipartFile.fromPath("half_body_image", file.path,contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        var pic = await http.MultipartFile.fromBytes ("half_body_image", uploadfile!);
        request.files.add(pic);
        var response = await request.send();
        if(response.statusCode==200) {
          var responseData = await response.stream.toBytes();
          var responseString = String.fromCharCodes(responseData);
          print(responseString);
        }else
          {

            print(response.statusCode);
          }

      }
    else
      {


      }



  }


  Future<void> getMultipleImageInfos() async
  {
    var mediaData = await ImagePickerWeb.getImageInfo;




    if (mediaData != null) {
      //String mimeType='';

      String?  mimeType = mime(PATH.basename(mediaData.fileName!));
      AvataObject avataObject = AvataObject(
          avataname: filb01aController.items[0].EMP_ID,
          base64: mediaData.base64,
          extension: mimeType!.split('/')[1]);
      var response1 = await post(Uri.parse('${kApiurl}Upload'),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + systemController.token.value
          },
          body: jsonEncode(avataObject)

      );
      if (response1.statusCode == 200) {
        systemController.avata.value = mediaData.base64!;
        filb01aController.items[0].extension = mimeType.split('/')[1];
      }
    }
  }

}