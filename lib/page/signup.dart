import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:email_validator/email_validator.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:get/get.dart';

import 'login_screen.dart';
class SignUp extends StatefulWidget
{

  @override
  _SignUpState createState()=> _SignUpState();
}
class _SignUpState extends State<SignUp>
{
  final formKey = GlobalKey<FormState>();
  SystemController stateSystem = Get.find();
  bool _autoValidate = false;
  final TextEditingController msnv = TextEditingController();
  final TextEditingController email =  TextEditingController();
  final TextEditingController pass1 =  TextEditingController();
  final TextEditingController pass2 =  TextEditingController();
  String? _msnv='';
  String? _email='';
  String? _pass1='';
  String? _pass2='';
  bool _passwordVisible=false;

  bool _passwordVisible2=false;

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }
  @override
  void dispose() {
    msnv.dispose();
    email.dispose();
    pass1.dispose();
    pass2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    if(stateSystem.changePass.isTrue)
      {
        msnv.text=stateSystem.username.value;
        _msnv=stateSystem.username.value;
        email.text=stateSystem.email.value;
        _email=stateSystem.email.value;
      }

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
          child:  Form(
            key: formKey,

            child: Stack(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text( stateSystem.changePass.isFalse?
                          LanguageService.signup:LanguageService.changepass,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        _buildmsnvnew(),
                        const SizedBox(
                          height: 0.0,
                        ),
                        _buildemailnew(),
                        const SizedBox(
                          height: 0.0,
                        ),
                        _buildPasswordTFnew(),
                        const SizedBox(
                          height: 0.0,
                        ),
                        _buildPasswordTF1new(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _buildLoginBtn(),

                      ],
                    ),
                  ),
                )
              ],
            ),
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
          //  initialValue:stateSystem.changePass.isFalse? '':stateSystem.username.value,
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
          child:  TextFormField(
            //  initialValue:stateSystem.changePass.isFalse? '':stateSystem.username.value,
            controller: msnv,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration:  InputDecoration(

              labelText: LanguageService.ENT_NM,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
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
            //initialValue: stateSystem.changePass.isFalse?'':stateSystem.email.value,
            validator: (value) => value!=null && !EmailValidator.validate(value)? LanguageService.emailvalidate:null,
            controller: email,
            keyboardType: TextInputType.emailAddress,
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
         // decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            //initialValue: stateSystem.changePass.isFalse?'':stateSystem.email.value,
            validator: (value) => value!=null && !EmailValidator.validate(value)? LanguageService.emailvalidate:null,
            controller: email,
            keyboardType: TextInputType.emailAddress,
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
            validator: (value)=>  value!.length>=4 ? null :"do dai it nhat 4 ki tu",
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


  Widget _buildPasswordTFnew() {
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
         // decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            validator: (value)=>  value!.length>=4 ? null :"do dai it nhat 4 ki tu",
            controller: pass1,
            obscureText: !_passwordVisible,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
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
              labelText: LanguageService.ENT_PS,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
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

  Widget _buildPasswordTF1() {
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
            validator: (value) => value!=null && _pass1==value ? null:LanguageService.passcomfirm,
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

  Widget _buildPasswordTF1new() {
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
          //decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            validator: (value) => value!=null && _pass1==value ? null:LanguageService.passcomfirm,
            controller: pass2,
            obscureText: !_passwordVisible2,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration:  InputDecoration(
              suffixIcon: IconButton  (
                icon: Icon(
                  _passwordVisible2?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColorDark,
                ),
                onPressed: (){
                  setState(() {
                    _passwordVisible2 = !_passwordVisible2;
                  });
                },
              ),

              labelText: LanguageService.passcomfirm,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
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
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)
                      ||  states.contains(MaterialState.disabled)) {
                    return 0;
                  }
                  return 10;
                },
              )
          )
      ,
        onPressed: () async {
          final form = formKey.currentState!;




          if (form.validate())
            {
             String s="";
              try {
               Utility.showLoaderDialog(context);
               if(stateSystem.changePass.isFalse) {
                 s = await ApiService.getSignUp(_msnv!, _email!, _pass1!);
               }else
                 {
                   s = await ApiService.changePassword(_msnv!, _email!, _pass1!);
                 }
             }finally{
                Navigator.pop(context);
                messageAllert(s,'Warning');
             }


            }



          // if(_msnv!='' && _email!='' && _pass1!='' && _pass2!='' && EmailValidator.validate(_email!)) {
          //   //showLoaderDialog(context);
          //  // setState(() {
          //     //_isLoading = true;
          //  // });
          //   //signIn(_email!,_pass);
          //   if(_pass1!=_pass2)
          //   {
          //     messageAllert('xác nhận mật khẩu không chính xác.','Warning');
          //   }
          // } else
          // {
          //   messageAllert('Bạn chưa nhập tên đăng nhập, email hoặc mật khẩu.','Warning');
          // }


        },

        child:  Text(
          LanguageService.signup,

        ),
      ),
    );
  }

  messageAllert(String msg, String ttl) {
    if(ttl!="Warning") {
      Navigator.pop(context);
    }
    bool is_warrning=msg.contains('[WARRNING]');
    String msg1=msg.replaceAll('[WARRNING]', '');


    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(ttl),
            content: Text(msg1),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: [
                    Text(LanguageService.OK),
                  ],
                ),
                onPressed: () {
                if(is_warrning) {
                  Navigator.pop(context);
                } else {
                  Get.to(const LoginScreen());
                }
                },
              ),
            ],
          );
        });
  }
}