import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  //final Color _color = const Color.fromARGB(220, 117, 218 ,255);
  final Color _color =  Colors.green.shade50;
  String? _title;
  String? _content;
  String? _yes;
  String? _no;
  Function? _yesOnPressed;
  Function? _noOnPressed;

  BaseAlertDialog({required String title, required String content, required Function yesOnPressed, required Function noOnPressed, String yes = "Yes", String no = "No"}){
    _title = title;
    _content = content;
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(_title!),
      content:  Text(_content!),
      backgroundColor:_color,
      shape:
      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.blueAccent
          ),
          child:  Text(_yes!),
         // textColor: Colors.greenAccent,
          onPressed: () {
            _yesOnPressed!();
          },
        ),
        TextButton(
          child: Text(_no!),
          style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.blueAccent),
        //  textColor: Colors.redAccent,
          onPressed: () {
            _noOnPressed!();
          },
        ),
      ],
    );
  }
}