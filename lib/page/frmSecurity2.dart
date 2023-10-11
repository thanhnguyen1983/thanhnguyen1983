import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:humanweb/components/SYS_GROUP_DEP.dart';
import 'package:humanweb/components/SYS_SECURITY.dart';
import 'package:humanweb/components/SYS_USER.dart';
import 'package:humanweb/components/sys_menu.dart';
import 'package:humanweb/state/sysMenuController.dart';
import 'package:humanweb/state/sysSecurityController.dart';

import '../state/frmSecurity2Controller.dart';
import '../state/sysGroupDepController.dart';
import '../state/sysUserController.dart';
import '../state/systemcontroller.dart';
import '../view/dlgCreateUsers.dart';
import '../widget/button_widget.dart';
class FrmSecurity2 extends StatefulWidget{
  final String groupId;
  const FrmSecurity2({Key? key,required this.groupId}): super(key: key);

  @override
  _FrmSecurity2 createState() => _FrmSecurity2();

}
class _FrmSecurity2  extends State<FrmSecurity2> {

  FrmSecurity2Controller frmSecurity2Controller=Get.put(FrmSecurity2Controller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(leading: BackButton(
        onPressed: () => Navigator.of(context).pop(),
      ),title: Text('系統設定'),
        actions:<Widget> [
          IconButton(onPressed: (){
            SmartDialog.show(builder: (_) {
            return Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Column(children: [
               Expanded(child: ClassDlgCreateUser( groupId: widget.groupId,)),

              ],),
            );
            });

          }, icon: Icon(Icons.add_circle_outline))
        ],
      ),
      body:  Obx(()=> frmSecurity2Controller.isLoading.isTrue  ? const Center(child: CircularProgressIndicator()): returnMenu(frmSecurity2Controller.currentIndex.value)) ,//screens[currentIndex],
      bottomNavigationBar: Obx(()=> frmSecurity2Controller.isLoading.isTrue  ? const Center(child: CircularProgressIndicator()): CurvedNavigationBar(
        color: Colors.blueAccent,
        backgroundColor: Colors.white,
        onTap: (index){

            frmSecurity2Controller.currentIndex.value=index;


        },
        index: frmSecurity2Controller.currentIndex.value,
        items:  [
          Icon(Icons.person,color: frmSecurity2Controller.currentIndex.value==0 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.account_tree,color: frmSecurity2Controller.currentIndex.value==1 ? Colors.black:Colors.white,size: 30,),

          Icon(Icons.menu,color: frmSecurity2Controller.currentIndex.value==2 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.menu,color: frmSecurity2Controller.currentIndex.value==3 ? Colors.black:Colors.white,size: 30,),

        ],

      ),
    ));
  }

  Widget returnMenu(int index) {
    switch(index) {
      case 0:
       return ListUsers();
        break;
      case 1:
        return ListDepartments();
        break;
      case 2:
        return ListMenuMaster();
        break;
      case 3:
        return  ListMenu();
        break;
      default:
        return ListUsers();
        break;
    }
  }


}



class ListUsers extends StatefulWidget{
  @override
  _ListUsers createState() => _ListUsers();

}
class _ListUsers  extends State<ListUsers>
{

  SysUserController sysUserController=Get.find();
  bool status = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Expanded(child: Obx(()=> (sysUserController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListViewUsers()))
    ],);
  }

  Widget getListViewUsers()
  {

    print('count getListViewUsers ${sysUserController.items.length}');
    var list=sysUserController.items.toList();

    list.sort((a,b)=>a.SEQ_NO!.compareTo(b.SEQ_NO!));
    return ReorderableListView.builder(itemBuilder: (context, index) {
      final item = list[index];

      return buildUser(index, item);
    }, itemCount: list.length, onReorder: (oldIndex, newIndex) => setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final user = list.removeAt(oldIndex);
      list.insert(index, user);
      for(int i=0;i<list.length;i++)
      {
        var item=list[i];
        item.SEQ_NO=(i+1);
        sysUserController.UpdateItem(item);
      }
    }));
  }
  Widget buildUser(int index, SYSUSER item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
        SmartDialog.show(builder: (_) {
          return Container(height: 100,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
            child: Padding(padding: const EdgeInsets.all(5),
              child: Column(children: [
                Container(height: 40,
                  child: Center(child: Text(item.USER_ID!),),),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    contentBoxDeleteModify(
                        context, item.USER_ID!)
                  ],))
              ],),),
          );
        }
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      leading: Container(width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.deepOrange),
        child: Center(child: Text('${index + 1}'),),),
      title: Text(item.USER_ID!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5, child: Container(color: Colors.black,),),

          Checkbox(value: item.USE_FG, onChanged: (bool? value) {  },),
          Text('Active'),
          const SizedBox(width: 20,),
          Checkbox(value: item.GPS_FG, onChanged: (bool? value) {  },),
          Text('NX'),
          const SizedBox(width: 20,)
        ],
      ),
    ),);
  }

  contentBoxDeleteModify(context,String user_id)
  {

    SYSUSER sysuser=sysUserController.findItem(user_id);
    bool status = sysuser.GPS_FG!;
    return CustomRadioButton(
      enableButtonWrap: true,
      elevation: 5,
      absoluteZeroSpacing: false,
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables:['刪除','更新'],
      buttonValues:['1','2'],
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.black,
          textStyle: TextStyle(fontSize: 14)),
      radioButtonValue: (value) {

        if(value=="1")
        {
          sysUserController.deleteItem(user_id);
          SmartDialog.dismiss();
        }
        if(value=="2")
        {
          //final updatedText =fila08aController.items.where((element) => element.GRP_ID==fila08a.GRP_ID).first.GRP_NM!;
          //  systemController.dlgGRP_ID.value=value;
          //  _controller.value=_controller.value.copyWith(text: updatedText,selection: TextSelection.collapsed(offset: updatedText.length));

          //  unitCodeCtrlFocusNode.requestFocus();
          SmartDialog.dismiss();


          SmartDialog.show(builder: (_) {
            return Container(height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: dlgUser(sysuser: sysuser,)/*Column(
                children: [
                  //Expanded(child: ClassdlgUpdateItemB( fila07aa: subfila07aController.items.where((element) => element.POS_ID==POS_ID && element.SUB_ID==SUB_ID).first))
                  Expanded(child: Column(children: [
                    SizedBox(height: 20,),
                    Text(sysuser.USER_ID!),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5, child: Container(color: Colors.black,),),

                        Checkbox(value: sysuser.USE_FG, onChanged: (bool? value) {
                          setState(() {
                            sysuser.USE_FG=value!;
                          });
                        },),
                        Text('Active'),
                        const SizedBox(width: 20,),
                        FlutterSwitch(
                          width: 100,
                          height: 40,
                          valueFontSize: 20.0,
                          toggleSize: 30.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 8.0,
                          showOnOff: true,
                          onToggle: (val){
                            setState(() {
                              status=val;
                            });
                          },
                        ),
                        Text('NX'),
                        const SizedBox(width: 20,)
                      ],
                    )
                  ],)),
                  Container(height: 40,color: Colors.transparent,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ButtonWidget(text: '同意', onClicked:() {

                        SmartDialog.dismiss();

                      })
                    ],),)
                ],
              )*/,
            );
          }
          );



        }
      },

      height: 40,
      width: 80,
      enableShape: true,
      spacing: 1,
      // horizontal: true,
      selectedColor: Theme.of(context).colorScheme.secondary,
    );
  }


}


class ListMenuMaster  extends StatefulWidget{



@override
_ListMenuMaster createState() => _ListMenuMaster();

}
class _ListMenuMaster  extends State<ListMenuMaster>
{

  SysMenuController sysMenuController=Get.put(SysMenuController());
  SystemController systemController=Get.find();
  FrmSecurity2Controller frmSecurity2Controller=Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Expanded(child: Obx(()=> (sysMenuController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListViewMenu()))
    ],);
  }

  Widget getListViewMenu()
  {


    var list=sysMenuController.items.toList();

    list.sort((a,b)=>a.SEQ_NO!.compareTo(b.SEQ_NO!));
    return ReorderableListView.builder(itemBuilder: (context, index) {
      final item = list[index];
      return buildMenu(index, item);
    }, itemCount: list.length, onReorder: (oldIndex, newIndex) => setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final user = list.removeAt(oldIndex);
      list.insert(index, user);
      for(int i=0;i<list.length;i++)
      {
        var item=list[i];
        item.SEQ_NO=(i+1);
        //sysMenuController.UpdateItem(item);
      }
    }));
  }
  Widget buildMenu(int index, SYS_MENU item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
        systemController.ID.value=item.ID!;
        frmSecurity2Controller.currentIndex.value=3;
        print(systemController.ID.value);

      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      leading: Container(width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.deepOrange),
        child: Center(child: Text('${index + 1}'),),),
      title: Text(item.VN!),

    ),);
  }




}





class ListDepartments extends StatefulWidget{
  @override
  _ListDepartments createState() => _ListDepartments();

}
class _ListDepartments  extends State<ListDepartments>
{

  SysGroupDepController sysGroupDepController=Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Expanded(child: Obx(()=> (sysGroupDepController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListViewDepartment()))
    ],);
  }

  Widget getListViewDepartment()
  {

    print('count getListViewUsers ${sysGroupDepController.items.length}');
    var list=sysGroupDepController.items.toList();

    list.sort((a,b)=>a.SEQ_NO!.compareTo(b.SEQ_NO!));
    return ReorderableListView.builder(itemBuilder: (context, index) {
      final item = list[index];

      return buildUser(index, item);
    }, itemCount: list.length, onReorder: (oldIndex, newIndex) => setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final user = list.removeAt(oldIndex);
      list.insert(index, user);
      for(int i=0;i<list.length;i++)
      {
        var item=list[i];
        item.SEQ_NO=(i+1);
        sysGroupDepController.UpdateItem(item);
      }
    }));
  }
  Widget buildUser(int index, SYS_GROUP_DEP item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
          setState(() {
            item.APV_FG=!item.APV_FG!;
            sysGroupDepController.UpdateItem(item);
          });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      leading: Container(width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.deepOrange),
        child: Center(child: Text('${index + 1}'),),),
      title: Text(item.DEP_NM!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5, child: Container(color: Colors.black,),),
          Checkbox(value: item.APV_FG, onChanged: (bool? value) {  },),
          SizedBox(width: 20,)
        ],
      ),
    ),);
  }
}

class ListMenu extends StatefulWidget{



  @override
  _ListMenu createState() => _ListMenu();

}
class _ListMenu  extends State<ListMenu>
{

  SysSecurityController sysSecurityController=Get.find();
  SystemController systemController=Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   /* return Scaffold(
      appBar: AppBar(leading: BackButton(
        onPressed: () => Navigator.of(context).pop(),
      ),title: Text('組別'),
        actions:<Widget> [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline))
        ],
      ),
      body: Column(children: [
        Expanded(child: Obx(()=> (sysSecurityController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListViewMenu()))
      ],),
    );*/
    return Column(children: [
      Expanded(child: Obx(()=> (sysSecurityController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListViewMenu(systemController.ID.value)))
    ],);
  }

  Widget getListViewMenu(int ID)
  {

    print('count getListViewUsers ${sysSecurityController.items.length}  ');
    var list=sysSecurityController.items.where((element) => element.H_ID==ID).toList();
    print('${ID} count  ${list.length}  ');
    list.sort((a,b)=>a.SEQ_NO!.compareTo(b.SEQ_NO!));
    return ReorderableListView.builder(itemBuilder: (context, index) {
      final item = list[index];

      return buildUser(index, item);
    }, itemCount: list.length, onReorder: (oldIndex, newIndex) => setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final user = list.removeAt(oldIndex);
      list.insert(index, user);
      for(int i=0;i<list.length;i++)
      {
        var item=list[i];
        item.SEQ_NO=(i+1);
        sysSecurityController.UpdateItem(item);
      }
    }));
  }
  Widget buildUser(int index, SYS_SECURITY item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
        SmartDialog.show(builder: (_) {
          return Container(height: 250,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
            child: dlgMenu(sys_security: item,)/*Column(
                children: [
                  //Expanded(child: ClassdlgUpdateItemB( fila07aa: subfila07aController.items.where((element) => element.POS_ID==POS_ID && element.SUB_ID==SUB_ID).first))
                  Expanded(child: Column(children: [
                    SizedBox(height: 20,),
                    Text(sysuser.USER_ID!),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5, child: Container(color: Colors.black,),),

                        Checkbox(value: sysuser.USE_FG, onChanged: (bool? value) {
                          setState(() {
                            sysuser.USE_FG=value!;
                          });
                        },),
                        Text('Active'),
                        const SizedBox(width: 20,),
                        FlutterSwitch(
                          width: 100,
                          height: 40,
                          valueFontSize: 20.0,
                          toggleSize: 30.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 8.0,
                          showOnOff: true,
                          onToggle: (val){
                            setState(() {
                              status=val;
                            });
                          },
                        ),
                        Text('NX'),
                        const SizedBox(width: 20,)
                      ],
                    )
                  ],)),
                  Container(height: 40,color: Colors.transparent,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ButtonWidget(text: '同意', onClicked:() {

                        SmartDialog.dismiss();

                      })
                    ],),)
                ],
              )*/,
          );
        }
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      leading: Container(width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.deepOrange),
        child: Center(child: Text('${index + 1}'),),),
      title: Text(item.MNU_NM!),
      subtitle: Column(children: [
        Row(children: [
        Checkbox(value: item.ADD, onChanged: (bool? value) {  },),
        Text('Add'),
        Checkbox(value: item.UPDATE, onChanged: (bool? value) {  },),
        Text('UPDATE'),Checkbox(value: item.DELETE, onChanged: (bool? value) {  },),
        Text('DELETE'),

        ],),
        Row(children: [
          Checkbox(value: item.USAGE, onChanged: (bool? value) {  },),
          Text('VIEW'),
          Checkbox(value: item.PRINT, onChanged: (bool? value) {  },),
          Text('PRINT'),
          Checkbox(value: item.APROVAL, onChanged: (bool? value) {  },),
          Text('APROVAL')])
      ],
      ),
      trailing: Text(''),
    ),);
  }
}
class dlgUser extends StatefulWidget
{
  SYSUSER sysuser;
  dlgUser({Key?key,required this.sysuser}):super(key: key);
  @override
  _dlgUser createState()=> _dlgUser();

}
class _dlgUser extends State<dlgUser>
{
  bool is_active=false;
  bool is_gps=false;
  SysUserController sysUserController=Get.find();
  @override
  void initState()
  {
    super.initState();
    is_active=widget.sysuser.USE_FG!;
    is_gps=widget.sysuser.GPS_FG!;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
     children: [
       //Expanded(child: ClassdlgUpdateItemB( fila07aa: subfila07aController.items.where((element) => element.POS_ID==POS_ID && element.SUB_ID==SUB_ID).first))
       Expanded(child: Column(children: [
         SizedBox(height: 20,),
         Text(widget.sysuser.USER_ID!),
         SizedBox(height: 20,),
         Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             SizedBox(height: 5, child: Container(color: Colors.black,),),

             FlutterSwitch(
               width: 60,
               height: 30,
               valueFontSize: 16.0,
               toggleSize: 20.0,
               value: is_active,
               borderRadius: 10.0,
               padding: 5.0,
               showOnOff: true,
               onToggle: (val){
                 setState(() {
                   is_active=val;
                   if(is_active && is_gps==true)
                   {
                     is_gps=false;
                   }
                 });
               },
             ),
             SizedBox(width: 10,),
             Text('Active'),
             const SizedBox(width: 20,),
             FlutterSwitch(
               width: 60,
               height: 30,
               valueFontSize: 16.0,
               toggleSize: 20.0,
               value: is_gps,
               borderRadius: 10.0,
               padding: 5.0,
               showOnOff: true,
               onToggle: (val){
                 setState(() {
                   is_gps=val;
                   if(is_gps && is_active==true)
                     {
                       is_active=false;
                     }
                 });
               },
             ),
             const SizedBox(width: 10,),
             const Text('NX'),
             const SizedBox(width: 20,)
           ],
         )
       ],)),
       Container(height: 40,color: Colors.transparent,child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           ButtonWidget(text: '同意', onClicked:() {

             widget.sysuser.GPS_FG=is_gps;
             widget.sysuser.USE_FG=is_active;
                sysUserController.UpdateItem(widget.sysuser);
             SmartDialog.dismiss();

           })
         ],),),
       SizedBox(height: 5,)
     ],
   );
  }

}

class dlgMenu extends StatefulWidget
{


  SYS_SECURITY sys_security;
  dlgMenu({Key?key,required this.sys_security}):super(key: key);
  @override
  _dlgMenu createState()=> _dlgMenu();
}
class _dlgMenu extends State<dlgMenu>
{
  bool is_Add=false;
  bool is_Update=false;
  bool is_Delete=false;
  bool is_View=false;
  bool is_Print=false;
  bool is_Apv=false;
  SysSecurityController sysSecurityController=Get.find();

  @override
  void initState()
  {
    super.initState();
    is_Add=widget.sys_security.ADD!;
    is_Update=widget.sys_security.UPDATE!;
    is_Delete=widget.sys_security.DELETE!;
    is_View=widget.sys_security.USAGE!;
    is_Print=widget.sys_security.PRINT!;
    is_Apv=widget.sys_security.APROVAL!;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //Expanded(child: ClassdlgUpdateItemB( fila07aa: subfila07aController.items.where((element) => element.POS_ID==POS_ID && element.SUB_ID==SUB_ID).first))
        Expanded(child: Column(children: [
          SizedBox(height: 20,),
          Text(widget.sys_security.MNU_NM!),
          SizedBox(height: 20,),

          Row(children: [SizedBox(width: 150,child: Row(children: [
            SizedBox(width: 10,),
            FlutterSwitch(
            width: 60,
            height: 30,
            valueFontSize: 16.0,
            toggleSize: 20.0,
            value: is_Add,
            borderRadius: 10.0,
            padding: 5.0,
            showOnOff: true,
            onToggle: (val){
              setState(() {
                is_Add=val;

              });
            },
          ),
            SizedBox(width: 10,),
            Text('Add'),],),),
            Expanded(child: Row(children: [
              FlutterSwitch(
            width: 60,
            height: 30,
            valueFontSize: 16.0,
            toggleSize: 20.0,
            value: is_Update,
            borderRadius: 10.0,
            padding: 5.0,
            showOnOff: true,
            onToggle: (val){
              setState(() {
                is_Update=val;

              });
            },
          ),
            const SizedBox(width: 10,),
            const Text('Update'),],))],),
          SizedBox(height: 10,),
          Row(children: [SizedBox(width: 150,child: Row(children: [
            SizedBox(width: 10,),
            FlutterSwitch(
              width: 60,
              height: 30,
              valueFontSize: 16.0,
              toggleSize: 20.0,
              value: is_Delete,
              borderRadius: 10.0,
              padding: 5.0,
              showOnOff: true,
              onToggle: (val){
                setState(() {
                  is_Delete=val;

                });
              },
            ),
            SizedBox(width: 10,),
            Text('Delete'),],),),
            Expanded(child: Row(children: [
              FlutterSwitch(
                width: 60,
                height: 30,
                valueFontSize: 16.0,
                toggleSize: 20.0,
                value: is_View,
                borderRadius: 10.0,
                padding: 5.0,
                showOnOff: true,
                onToggle: (val){
                  setState(() {
                    is_View=val;

                  });
                },
              ),
              const SizedBox(width: 10,),
              const Text('View'),],))],),
          SizedBox(height: 10,),
          Row(children: [SizedBox(width: 150,child: Row(children: [
            SizedBox(width: 10,),
            FlutterSwitch(
              width: 60,
              height: 30,
              valueFontSize: 16.0,
              toggleSize: 20.0,
              value: is_Print,
              borderRadius: 10.0,
              padding: 5.0,
              showOnOff: true,
              onToggle: (val){
                setState(() {
                  is_Print=val;

                });
              },
            ),
            SizedBox(width: 10,),
            Text('Print'),],),),
            Expanded(child: Row(children: [
              FlutterSwitch(
                width: 60,
                height: 30,
                valueFontSize: 16.0,
                toggleSize: 20.0,
                value: is_Apv,
                borderRadius: 10.0,
                padding: 5.0,
                showOnOff: true,
                onToggle: (val){
                  setState(() {
                    is_Apv=val;

                  });
                },
              ),
              const SizedBox(width: 10,),
              const Text('Approval'),],))],),


        ],)),
        Container(height: 40,color: Colors.transparent,child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ButtonWidget(text: '同意', onClicked:() {

              widget.sys_security.ADD=is_Add;
              widget.sys_security.UPDATE=is_Update;
              widget.sys_security.DELETE=is_Delete;
              widget.sys_security.USAGE=is_View;
              widget.sys_security.PRINT=is_Print;
              widget.sys_security.APROVAL=is_Apv;
              sysSecurityController.UpdateItem(widget.sys_security);
              SmartDialog.dismiss();

            })
          ],),),
        SizedBox(height: 5,)
      ],
    );
  }
  }


