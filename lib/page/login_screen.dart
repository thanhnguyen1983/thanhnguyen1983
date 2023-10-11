import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/page/forgotpass.dart';
import 'package:humanweb/page/page_home.dart';
import 'package:humanweb/page/signup.dart';
import 'package:humanweb/state/fila15acontroller.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/filc01acontroller.dart';
import 'package:humanweb/state/filc03acontroller.dart';
import 'package:humanweb/state/filc06aacontroller.dart';
import 'package:humanweb/state/filc06acontroller.dart';
import 'package:humanweb/state/gp_sys_shiftcontroller.dart';
import 'package:humanweb/state/statuscodecontroller.dart';
import 'package:humanweb/state/sys_notificationcontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import '../main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:device_info_plus/device_info_plus.dart';
import '../state/filc04aacontroller.dart';
import 'dart:html' as html;
import 'myhomepage.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key?key}):super(key:key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

 // bool _rememberMe = false;
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =  TextEditingController();
   String? _email='';
   String? _pass='';

  final storage = GetStorage();
  final _formKey = GlobalKey<FormState>();
  Filb01aController filb01aController=Get.find();
  StatusCodeController statusCodeController=Get.find();
  Filc04aaController filc04aaController=Get.put(Filc04aaController());
  bool _passwordVisible=false;
  @override
  void initState() {
    _passwordVisible = false;

  }
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(
          LanguageService.EMP_ID,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(

            controller: emailController,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: LanguageService.ENT_NM,
              hintStyle: kHintTextStyle,
            ),
            onChanged: ((String email){
              setState(() {
                _email=email;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(
          LanguageService.PAS_NO,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration:  InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: LanguageService.ENT_PS,
              hintStyle: kHintTextStyle,
            ),
            onChanged: ((String pass){
              setState(() {
                _pass=pass;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: ()  {
          Get.to(ForgotPassWord());
        },

        child:  Text(
          LanguageService.FOR_DR,
          style: kLabelStyle,
        ),
      ),
    );
  }

  // Widget _buildRememberMeCheckbox() {
  //   return Container(
  //     height: 20.0,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: _rememberMe,
  //             checkColor: Colors.green,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 _rememberMe = value!;
  //               });
  //             },
  //           ),
  //         ),
  //          Text(
  //           LanguageService.REM_PS,
  //           style: kLabelStyle,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(

              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white)
                  )
              )
          ),
        onPressed: () async {

         // var pos=await Utility.determinePosition();
         // print('longitude:${pos.longitude} ,latitude:${pos.latitude}');

          if(_email!='' && _pass!='') {
            // showLoaderDialog(context);
            // setState(() {
            //   _isLoading = true;
            // });
            // signIn(_email!,_pass);
         try {
           Utility.showLoaderDialog(context);
           await filb01aController.Login(_email!, _pass!);
           if (statusCodeController.statuscode.value == 200) {
             if (filb01aController.items.isNotEmpty) {
               SystemController systemController = Get.put(SystemController());
               systemController.username.value =
               filb01aController.items[0].EMP_ID!;
               systemController.token.value = filb01aController.items[0].token!;
               systemController.GROUP_ID.value=filb01aController.items[0].GROUP_ID!;
               print('GROUP_ID : ${filb01aController.items[0].GROUP_ID!}');

               Filc01aController filc01aController = Get.put(
                   Filc01aController());
               Fila15aController fila15aController = Get.put(
                   Fila15aController());
               Filc03aController filc03aController = Get.put(
                   Filc03aController());
               Filc06aController filc06aController = Get.put(
                   Filc06aController());
               Filc06aaController filc06aaController = Get.put(
                   Filc06aaController());
               Sys_NotificationController sys_notificationController = Get.put(
                   Sys_NotificationController());
               Gp_sys_ShiftController gp_sys_shiftController = Get.put(
                   Gp_sys_ShiftController());

               filc04aaController.fetchProducts(systemController.username.value,'','1');
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                   builder: (BuildContext context) =>
                   filb01aController.items[0].iPrivilege == 4
                       ? const PageHome()
                       : MyHomePage()), (Route<dynamic> route) => false);
             }
           }
         }finally{
           if (statusCodeController.statuscode.value != 200) {
             Navigator.pop(context);
             messageAllert(LanguageService.errorlogin, 'Warning');
           }
         }

          } else
            {
              messageAllert('Bạn chưa nhập tên đăng nhập hoặc mật khẩu.','Warning');
            }



        },

        child:  Text(
          LanguageService.LOG_IN,
          style: const TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  //   return GestureDetector(
  //     onTap: onTap(),
  //     child: Container(
  //       height: 60.0,
  //       width: 60.0,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.white,
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 2),
  //             blurRadius: 6.0,
  //           ),
  //         ],
  //         image: DecorationImage(
  //           image: logo,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildSocialBtnRow() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 30.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         _buildSocialBtn(
  //               () => print('Login with Facebook'),
  //           const AssetImage(
  //             'assets/logos/facebook.jpg',
  //           ),
  //         ),
  //         _buildSocialBtn(
  //               () => print('Login with Google'),
  //           const AssetImage(
  //             'assets/logos/google.jpg',
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => {Get.to(SignUp())},
      child: RichText(
        text:  TextSpan(
          children: [
            TextSpan(
              text: (LanguageService.donthaveaccount),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: (LanguageService.signup),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool isMobile() {
    if (kIsWeb) {
      var userAgent = html.window.navigator.userAgent;
      return userAgent.contains('Android') || userAgent.contains('Mobile');
    }
    return false;
  }


  signIn(String user, pass) async
  {



    //storage.write('rememberMe',_rememberMe);
    filb01aController.Login(user, pass).then((value) {
              if (value.isNotEmpty) {
                storage.write("EMP_ID", user);
                // if (_rememberMe) {
                //  // SharedPreferencesRepository.putString('Pass', pass);
                //   storage.write("Pass", pass);
                // }
                SystemController systemController=Get.put(SystemController());
                systemController.username.value=filb01aController.items[0].EMP_ID!;
                systemController.token.value=filb01aController.items[0].token!;
                systemController.GROUP_ID.value=filb01aController.items[0].GROUP_ID!;

                print('group id ${systemController.GROUP_ID.value}');

                Filc01aController filc01aController=Get.put(Filc01aController());
                Fila15aController fila15aController=Get.put(Fila15aController());
                Filc03aController filc03aController=Get.put(Filc03aController());
                Filc06aController filc06aController=Get.put(Filc06aController());
                Filc06aaController filc06aaController=Get.put(Filc06aaController());
                Sys_NotificationController sys_notificationController=Get.put(Sys_NotificationController());
                Gp_sys_ShiftController gp_sys_shiftController=Get.put(Gp_sys_ShiftController());

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (BuildContext context) => filb01aController.items[0].iPrivilege==4? const PageHome():MyHomePage()), (
                    Route<dynamic> route) => false);////////4 quyen admin ,ngoai ra use
              }
              else {
                messageAllert(
                    'Tên đăng nhập hoăc mật khẩu không chính xac.', 'Warning');
                // _rememberMe = false;
                // storage.write('rememberMe',_rememberMe);

                // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                //     builder: (BuildContext context) => const LoginScreen()), (
                //     Route<dynamic> route) => false);
              }
            } );


      // await SharedPreferencesRepository.init();
      // SharedPreferencesRepository.putBool("rememberMe", _rememberMe);




  }

  Widget _buildLanguage()
  {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            // needed
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  LanguageService.language='ch';
                  storage.write("defaultLanguage", 'ch');
                });

                }, // needed
              child: Image.asset(
                "images/1.png",
                width: 22,
                fit: BoxFit.cover,
              ),
            ),
          ),
         const SizedBox(width:20),
          Material(
            // needed
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  LanguageService.language='vn';
                  storage.write("defaultLanguage", 'vn');

                });

                }, // needed
              child: Image.asset(
                "images/14.png",
                width: 22,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }
  @override
  Widget build(BuildContext context) {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // late TargetPlatform platform;

    final  TargetPlatform platform = Theme.of(context).platform;

     return MaterialApp(
         debugShowCheckedModeBanner: false,
       title: 'Humanresouce',
       home: Scaffold(
         appBar: AppBar(title: const Text('Humanresouce'),
         ),
         body: Padding(
             padding: const EdgeInsets.all(10),
             child: (isMobile()==false ? Center(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 1,color: Colors.grey)),height: 450,width: 400,child:ListView(
               children: <Widget>[
                 Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(10),
                     child: const Text(
                       'Humanresouce Manager',
                       style: TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.w500,
                           fontSize: 30),
                     )),
                 Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(10),
                     child:  Text(
                       LanguageService.LOG_IN,
                       style: const TextStyle(fontSize: 20),
                     )),
                 Container(
                   padding: const EdgeInsets.all(10),
                   child: TextField(

                     controller: emailController,
                     decoration:  InputDecoration(
                       labelText: LanguageService.EMP_ID,
                       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                     ),
                     onChanged: ((String email) {
                       setState(() {
                         _email=email;
                       });
                     }
                     ),
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                   child: TextField(
                     obscureText: !_passwordVisible,
                     controller: passwordController,
                     decoration:  InputDecoration(
                       suffixIcon: IconButton  (
                         icon: Icon(
                           _passwordVisible?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColorDark,
                         ),
                         onPressed: (){
                           setState(() {
                             _passwordVisible = !_passwordVisible;
                           });
                         },
                       ),
                       labelText: LanguageService.PAS_NO,
                       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                     ),
                     onChanged: ((String pass){
                       setState(() {
                         _pass=pass;
                       });
                     }),
                   ),
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 TextButton(
                   onPressed: () {
                     Get.to(ForgotPassWord());
                   },
                   child:  Text(LanguageService.FOR_DR,),
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 Container(
                     height: 50,
                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                     child: ElevatedButton(
                       child:  Text(LanguageService.LOG_IN),
                       onPressed: () async {
                         if(_email!='' && _pass!='')
                         {
                           try
                           {
                             Utility.showLoaderDialog(context);
                             await filb01aController.Login(_email!, _pass!);
                             if (statusCodeController.statuscode.value == 200) {
                               if (filb01aController.items.isNotEmpty) {
                                 SystemController systemController = Get.put(SystemController());
                                 systemController.username.value =
                                 filb01aController.items[0].EMP_ID!;
                                 systemController.token.value = filb01aController.items[0].token!;
                                 systemController.GROUP_ID.value = filb01aController.items[0].GROUP_ID!;
                                 Filc01aController filc01aController = Get.put(
                                     Filc01aController());
                                 Fila15aController fila15aController = Get.put(
                                     Fila15aController());
                                 Filc03aController filc03aController = Get.put(
                                     Filc03aController());
                                 Filc06aController filc06aController = Get.put(
                                     Filc06aController());
                                 Filc06aaController filc06aaController = Get.put(
                                     Filc06aaController());
                                 Sys_NotificationController sys_notificationController = Get.put(
                                     Sys_NotificationController());
                                 Gp_sys_ShiftController gp_sys_shiftController = Get.put(
                                     Gp_sys_ShiftController());

                                 filc04aaController.fetchProducts(systemController.username.value,'','1');
                                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                     builder: (BuildContext context) =>
                                     filb01aController.items[0].iPrivilege == 4
                                         ? const PageHome()
                                         : MyHomePage()), (Route<dynamic> route) => false);
                               }
                             }
                           }finally
                           {
                             if (statusCodeController.statuscode.value != 200) {
                               Navigator.pop(context);
                               messageAllert(LanguageService.errorlogin, 'Warning');
                             }
                           }

                         }else
                         {
                           messageAllert('Bạn chưa nhập tên đăng nhập hoặc mật khẩu.','Warning');
                         }
                       },
                     )
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 Row(
                   children: <Widget>[
                     Text(LanguageService.donthaveaccount),
                     TextButton(
                       child:  Text(
                         LanguageService.signup,
                         style: TextStyle(fontSize: 20),
                       ),
                       onPressed: () {
                         Get.to(SignUp());
                       },
                     )
                   ],
                   mainAxisAlignment: MainAxisAlignment.center,
                 ),

                 const SizedBox(
                   height: 10.0,
                 ),
                 _buildLanguage()
               ],
             ))):ListView(
               children: <Widget>[
                 Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(10),
                     child: const Text(
                       'Humanresouce Manager',
                       style: TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.w500,
                           fontSize: 30),
                     )),
                 Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(10),
                     child:  Text(
                       LanguageService.LOG_IN,
                       style: const TextStyle(fontSize: 20),
                     )),
                 Container(
                   padding: const EdgeInsets.all(10),
                   child: TextField(

                     controller: emailController,
                     decoration:  InputDecoration(
                       labelText: LanguageService.EMP_ID,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                     ),
                     onChanged: ((String email) {
                       setState(() {
                         _email=email;
                       });
                     }
                     ),
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                   child: TextField(
                     obscureText: !_passwordVisible,
                     controller: passwordController,
                     decoration:  InputDecoration(
                       suffixIcon: IconButton  (
                         icon: Icon(
                           _passwordVisible?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColorDark,
                         ),
                         onPressed: (){
                           setState(() {
                             _passwordVisible = !_passwordVisible;
                           });
                         },
                       ),
                       labelText: LanguageService.PAS_NO,
                       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                     ),
                     onChanged: ((String pass){
                       setState(() {
                         _pass=pass;
                       });
                     }),
                   ),
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 TextButton(
                   onPressed: () {
                     Get.to(ForgotPassWord());
                   },
                   child:  Text(LanguageService.FOR_DR,),
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 Container(
                     height: 50,
                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                     child: ElevatedButton(
                       child:  Text(LanguageService.LOG_IN),
                       onPressed: () async {
                         if(_email!='' && _pass!='')
                         {
                            try
                                {
                                  Utility.showLoaderDialog(context);
                                  await filb01aController.Login(_email!, _pass!);
                                  if (statusCodeController.statuscode.value == 200) {
                                    if (filb01aController.items.isNotEmpty) {
                                      SystemController systemController = Get.put(SystemController());
                                      systemController.username.value =
                                      filb01aController.items[0].EMP_ID!;
                                      systemController.token.value = filb01aController.items[0].token!;
                                      systemController.GROUP_ID.value = filb01aController.items[0].GROUP_ID!;
                                      Filc01aController filc01aController = Get.put(
                                          Filc01aController());
                                      Fila15aController fila15aController = Get.put(
                                          Fila15aController());
                                      Filc03aController filc03aController = Get.put(
                                          Filc03aController());
                                      Filc06aController filc06aController = Get.put(
                                          Filc06aController());
                                      Filc06aaController filc06aaController = Get.put(
                                          Filc06aaController());
                                      Sys_NotificationController sys_notificationController = Get.put(
                                          Sys_NotificationController());
                                      Gp_sys_ShiftController gp_sys_shiftController = Get.put(
                                          Gp_sys_ShiftController());

                                      filc04aaController.fetchProducts(systemController.username.value,'','1');
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          filb01aController.items[0].iPrivilege == 4
                                              ? const PageHome()
                                              : MyHomePage()), (Route<dynamic> route) => false);
                                    }
                                  }
                                }finally
                                {
                                  if (statusCodeController.statuscode.value != 200) {
                                    Navigator.pop(context);
                                    messageAllert(LanguageService.errorlogin, 'Warning');
                                  }
                                }

                         }else
                         {
                            messageAllert('Bạn chưa nhập tên đăng nhập hoặc mật khẩu.','Warning');
                         }
                       },
                     )
                 ),
                 const SizedBox(
                   height: 10.0,
                 ),
                 Row(
                   children: <Widget>[
                     Text(LanguageService.donthaveaccount),
                     TextButton(
                       child:  Text(
                         LanguageService.signup,
                         style: TextStyle(fontSize: 20),
                       ),
                       onPressed: () {
                         Get.to(SignUp());
                       },
                     )
                   ],
                   mainAxisAlignment: MainAxisAlignment.center,
                 ),

                 const SizedBox(
                   height: 10.0,
                 ),
                 _buildLanguage()
               ],
             ))),
       )
     );
  }


  messageAllert(String msg, String ttl) {
    if(ttl!="Warning") {
      Navigator.pop(context);
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(ttl),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: [
                    Text(LanguageService.OK),
                  ],
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()), (
                      Route<dynamic> route) => false);
                },
              ),
            ],
          );
        });
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
           const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }



}

