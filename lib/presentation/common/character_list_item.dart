import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:humanweb/components/filb01a.dart';
import 'package:humanweb/page/myhomepage.dart';
import 'package:humanweb/page/signup.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:get/get.dart';
class CharacterListItem extends StatelessWidget {
   CharacterListItem({
    required this.character,
    Key? key,
  }) : super(key: key);

  final FILB01A character;
Filb01aController filb01aController=Get.find();
   SystemController systemController=Get.find();
  @override
  Widget build(BuildContext context) => ListTile(

    onLongPress:resetPass,
    onTap: (){
     // Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoEdit(character)));
      systemController.avata.value="avata";
      filb01aController.addItem(<FILB01A>[character]);
      Get.to(MyHomePage());

    },
    leading: CircleAvatar(
      radius: 20,
     // backgroundImage: CachedNetworkImageProvider(character.pictureUrl),
      //'${urlImage}${filb01aController.items[0].EMP_ID}.${filb01aController.items[0].extension
      backgroundImage: CachedNetworkImageProvider('${urlImage}${character.EMP_ID}.${character.extension}'),
    ),
    title: Text('${character.EMP_NM!} ${character.EMP_N1!}'),
    subtitle: Text(character.EMP_ID!),
  );
  
  void resetPass()
  {
    systemController.changePass.value=true;

    print('EMP_ID ${character.EMP_ID}');
    print('EML_DR ${character.EML_DR}');

    systemController.username.value=character.EMP_ID!;
    systemController.email.value=character.EML_DR!;
    Get.to(SignUp());
  }
}