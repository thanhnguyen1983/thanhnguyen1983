import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanweb/components/SYS_USER.dart';
import 'package:get/get.dart';
import '../state/sysUserController.dart';
import '../utilities/constants.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';
import '../widget/button_widget.dart';

class ClassDlgCreateUser extends StatefulWidget
{

  final String groupId;
  const ClassDlgCreateUser({Key? key,required this.groupId}): super(key: key);
  @override
  _ClassDlgCreateUser createState() => _ClassDlgCreateUser();
}
class _ClassDlgCreateUser  extends State<ClassDlgCreateUser>
{

  final TextEditingController msnv = TextEditingController();
  final TextEditingController email =  TextEditingController();
  final TextEditingController pass1 =  TextEditingController();
  final TextEditingController pass2 =  TextEditingController();
  SysUserController sysUserController=Get.find();
  String? _msnv='';
  String? _email='';
  String? _pass1='';
  String? _pass2='';
  bool _passwordVisible=false;

  bool _passwordVisible2=false;
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(10),
    child: Column(children: [
      Expanded(child: Column(children: [
        _buildmsnvnew(),
        _buildPasswordTFnew(),
        _buildPasswordTF1new(),
        Text(errorText)
      ],)),
      Container(height: 40,color: Colors.transparent,child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ButtonWidget(text: 'Save', onClicked:() async{

            if(_msnv=='')
              {
                errorText='Please input msnv';
                return;
              }
            if(_pass1!=_pass2)
              {
                setState(() {
                  errorText = 'Passwords do not match';
                });
              }else {

                errorText='';
                SYSUSER sysuser=SYSUSER(USER_ID: _msnv,USER_NAME: _msnv,PASS: Utility.encryptString(_pass1!),GROUP_ID: widget.groupId,GPS_FG: false,USE_FG: true,SEQ_NO: 999);
                sysUserController.createUser(sysuser).then((value) {
                  if(value!=200)
                    {
                      setState(() {
                        errorText="Error";
                      });
                    }
                });


              if(errorText=='') {
                SmartDialog.dismiss();
              }
            }

          })
        ],),),
    ],),
    );
  }


  Widget _buildmsnvnew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
     /*   Text(
          LanguageService.EMP_ID,
          style: kLabelStyle,
        ),*/
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




  Widget _buildPasswordTFnew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       /* Text(
          LanguageService.PAS_NO,
          style: kLabelStyle,
        ),*/
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

  Widget _buildPasswordTF1new() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Text(
          LanguageService.passcomfirm,
          style: kLabelStyle,
        ),*/
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


}