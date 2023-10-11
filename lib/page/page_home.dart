import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:humanweb/widget/dashboard.dart';
class PageHome extends StatefulWidget
{
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState()=>_PageHomeState();
}
class _PageHomeState extends State<PageHome>
{
  //SystemController systemController=Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Humanresouce manager'),
      //   leading: const Icon(Icons.menu),
      //   actions: const [
      //     Icon(Icons.search)
      //   ],
      // ),
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(child: Dashboard(),)

        ,

    );
  }

}