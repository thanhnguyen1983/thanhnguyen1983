import 'package:animate_do/animate_do.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //print('$screenWidth - $screenHeight');
    bool isPhone=Utility.isMobile(screenWidth,screenHeight);

    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.signup),
        leading:IconButton(onPressed: (){Get.back();},icon:const Icon(Icons.arrow_back_ios) ),

      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          //  child: _isLoading ? const Center(child:  CircularProgressIndicator()) : Stack(
          child:  Form(
            key: formKey,

            child:isPhone? SignUpPhone():  Stack(children: [ Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.jpg'), // Replace with the actual path to your image
                  fit: BoxFit.cover,
                ),
              ),
            ),Padding(padding: EdgeInsets.all(isPhone?0:20.0),child: Center(child: Container(width: 500,height: 650,child: SignUpPhone(),),),)],),
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

      children: <Widget>[

        Container(
          padding: const EdgeInsets.all(spaceHeight),
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

      children: <Widget>[

        Container(
          padding: const EdgeInsets.all(spaceHeight),
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

      children: <Widget>[

        Container(
          padding: const EdgeInsets.all(spaceHeight),
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

      children: <Widget>[

        Container(
          padding: const EdgeInsets.all(spaceHeight),
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

      height: 40,

      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 120,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width: 2, color: Colors.deepOrangeAccent),
          ),

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
                messageAllert(s,LanguageService.Notification);
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



  Widget SignUpPhone()
  {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange.shade900,
                Colors.orange.shade800,
                Colors.orange.shade400
              ]
          )
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(spaceHeight),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInUp(duration: const Duration(milliseconds: 1000), child:  Text( stateSystem.changePass.isFalse?
                LanguageService.signup:LanguageService.changepass,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),),

              ],
            ),
          ),
          const SizedBox(height: spaceHeight),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
              ),
              child: Padding(
                padding: const EdgeInsets.all(spaceHeight),
                child: SingleChildScrollView(child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10,),
                    FadeInUp(duration: const Duration(milliseconds: 1000), child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                          )]
                      ),
                      child: Padding(padding: EdgeInsets.all(5),child: Column(
                        children: <Widget>[

                      FadeInUp(duration: const Duration(milliseconds: 1000),child: _buildmsnvnew()),

                      FadeInUp(duration: const Duration(milliseconds: 1200),child:  _buildemailnew()),

                      FadeInUp(duration: const Duration(milliseconds: 1600),child:   _buildPasswordTFnew()),

                        FadeInUp(duration: const Duration(milliseconds: 1800),child:    _buildPasswordTF1new()),
                          const SizedBox(height: 20,),
                      FadeInUp(duration: const Duration(milliseconds: 2000),child:  _buildLoginBtn()),
                         const SizedBox(height: 20,)
                        ],
                      ),),
                    )),
                 //   FadeInUp(duration: const Duration(milliseconds: 1400), child:_buildLoginBtn()),
                  ],
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}