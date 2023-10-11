import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/page/login_screen.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:get/get.dart';

import '../api/ApiLogin.dart';
class ForgotPassWord extends StatefulWidget{

  @override
  _ForgotPassWord createState()=>_ForgotPassWord();
}
class _ForgotPassWord extends State<ForgotPassWord>
{
  final formKey = GlobalKey<FormState>();
  final TextEditingController msnv =  TextEditingController();
  final TextEditingController email =  TextEditingController();
  String? _msnv='';
  String? _email='';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.LOG_IN),
        leading:IconButton(onPressed: (){Get.back();},icon:const Icon(Icons.arrow_back_ios) ),

      ),
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
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          LanguageService.forgotpass,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        _buildmsnvnew(),

                        _buildemailnew(),
                        const SizedBox(
                          height: 30.0,
                        ),

                        _buildLoginBtn(),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildmsnv() {
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

            controller: msnv,
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
            onChanged: ((String value){
              setState(() {
                _msnv=value;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildmsnvnew() {
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

          height: 60.0,
          child:TextField(

            controller: msnv,
            decoration:  InputDecoration(
              labelText: LanguageService.ENT_NM,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
            ),
            onChanged: ((String value) {
              setState(() {
                _msnv=value;
              });
            }
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          LanguageService.email,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            validator: (value) => value!=null && !EmailValidator.validate(value)? LanguageService.emailvalidate:null,
            controller: email,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.white,
              ),
              hintText: LanguageService.email,
              hintStyle: kHintTextStyle,
            ),
            onChanged: ((String value){
              setState(() {
                _email=value;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildemailnew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          LanguageService.email,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,

          height: 60.0,
          child:  TextFormField(
            validator: (value) => value!=null && !EmailValidator.validate(value)? LanguageService.emailvalidate:null,
            controller: email,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration:  InputDecoration(
              labelText: LanguageService.email,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
            ),
            onChanged: ((String value){
              setState(() {
                _email=value;
              });
            }),
          ),
        ),
      ],
    );
  }



  Widget _buildLoginBtn() {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () async {

          final form = formKey.currentState!;
          if (form.validate())
          {
            String s="";
            try {
              showLoaderDialog(context);
              s = await ApiLogin.getPassWord(_msnv!, _email!);
            }
            finally{
              Navigator.pop(context);
              messageAllert(s,'Warning');
            }

          }


          if( _email!='') {
            //showLoaderDialog(context);
            // setState(() {
            //_isLoading = true;
            // });
            //signIn(_email!,_pass);

          } else
          {
            messageAllert('Bạn chưa nhập email.','Warning');
          }


        },

        child:  Text(
          LanguageService.OK,

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
                  Get.to(const LoginScreen());
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