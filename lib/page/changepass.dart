import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:get/get.dart';
class ChangePassword extends StatefulWidget {

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}
 class _ChangePasswordState extends State<ChangePassword>{

   final TextEditingController pass0 =  TextEditingController();
   final TextEditingController pass1 =  TextEditingController();
   final TextEditingController pass2 =  TextEditingController();

   String? _pass0='';
   String? _pass1='';
   String? _pass2='';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      // appBar: AppBar(
      //   title:  Text(LanguageService.changepass),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: ()=> Get.back(),
      //   ),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          //  child: _isLoading ? const Center(child:  CircularProgressIndicator()) : Stack(
          child:  Stack(
            children: <Widget>[

              //Positioned(bottom: 5,right: 5,child: _buildLanguage()),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        LanguageService.changepass,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15.0),

                      _buildPasswordTF0(),
                      const SizedBox(height: 15.0),
                      _buildPasswordTF1(),
                      const SizedBox(height: 15.0),
                      _buildPasswordTF2(),
                      const SizedBox(height: 15.0),

                      _buildLoginBtn(),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



   Widget _buildPasswordTF0() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
           LanguageService.passcurrent,
           style: kLabelStyle,
         ),
         const SizedBox(height: 10.0),
         Container(
           alignment: Alignment.centerLeft,
           decoration: kBoxDecorationStyle,
           height: 60.0,
           child:  TextFormField(
             controller: pass0,
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
               hintText: LanguageService.passcurrent,
               hintStyle: kHintTextStyle,
             ),
             onChanged: ((String pass){
               setState(() {
                 _pass0=pass;
               });
             }),
           ),
         ),
       ],
     );
   }
  Widget _buildPasswordTF1() {
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
            controller: pass1,
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
                _pass1=pass;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          LanguageService.passcomfirm,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            controller: pass2,
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
              hintText: LanguageService.passcomfirm,
              hintStyle: kHintTextStyle,
            ),
            onChanged: ((String pass){
              setState(() {
                _pass2=pass;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () {




          if( _pass0!='' && _pass1!='' && _pass2!='') {
            //showLoaderDialog(context);
            // setState(() {
            //_isLoading = true;
            // });
            //signIn(_email!,_pass);
            if(_pass1!=_pass2)
            {
              messageAllert('xác nhận mật khẩu không chính xác.','Warning');
            }
          } else
          {
            messageAllert('Bạn chưa nhập mật khẩu cũ và mật khẩu mới.','Warning');
          }


        },

        child:  Text(
          LanguageService.changepass,
          style: const TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
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
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  }




