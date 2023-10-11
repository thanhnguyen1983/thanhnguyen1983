import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:humanweb/components/fild01a.dart';
import 'package:humanweb/state/sysGroupDepController.dart';
import 'package:humanweb/state/sysSecurityController.dart';
import 'package:humanweb/state/sysUserController.dart';

import '../components/SYS_GROUP.dart';
import '../state/fild01acontroller.dart';
import '../state/sysGroupController.dart';
import '../widget/button_widget.dart';
import 'frmSecurity2.dart';
class FrmSecurity extends StatefulWidget{
  @override
  _FrmSecurity createState() => _FrmSecurity();

}
class _FrmSecurity  extends State<FrmSecurity>
{
  var currentIndex=0;
  SysGroupController sysGroupController=Get.put(SysGroupController());
  SysUserController sysUserController=Get.put(SysUserController());
  SysGroupDepController sysGroupDepController=Get.put(SysGroupDepController());
  SysSecurityController sysSecurityController=Get.put(SysSecurityController());
  Fild01aController fild01aController=Get.put(Fild01aController());
  var list;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(leading: BackButton(
        onPressed: () => Navigator.of(context).pop(),
      ),title: const Text('組別'),
      actions:<Widget> [
        IconButton(onPressed: (){
           for(int i=0;i<list.length;i++)
      {
        var item11=list[i];
        item11.SEQ_MB=(i+1);
        fild01aController.UpdateItem(item11);
      }
        }, icon:  Icon(Icons.save))
      ],
      ),
      body: Obx(()=> (fild01aController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()):returnMenu(currentIndex)),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blueAccent,
        backgroundColor: Colors.white,
        onTap: (index){
          setState(() {
            currentIndex=index;
            if(currentIndex==1)
            {
              // filc01aController.isLoading(true);
              //filc01aController.fetchProducts();
            }
            if(currentIndex==3)
            {


              // sys_notificationController.fetchSYS_NOTIFICATION(filb01aController.items[0].EMP_ID!);
            }
          });
        },
        index: currentIndex,
        items:  [
          Icon(Icons.security,color: currentIndex==0 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.menu,color: currentIndex==1 ? Colors.black:Colors.white,size: 30,),
          Icon(Icons.menu,color: currentIndex==2 ? Colors.black:Colors.white,size: 30,),
        ],

      ),
       /* floatingActionButton: FloatingActionButton(
          onPressed: () {

              },
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        )*/
    );
    return buildColumn();
  }
  Widget returnMenu(int index) {
    switch(index) {
      case 0:
        return buildColumn();
        break;
      case 1:
        return ListShowNote(true);
        break;
      case 2:
        return ListShowNote(false);
        break;
      default:
        return buildColumn();
        break;

    }
  }
  Column buildColumn() {
    return Column(children: [
      Expanded(child: Obx(()=> (sysGroupController.isLoading.isTrue ) ? const Center(child: CircularProgressIndicator()): getListview()))
    ],);
  }


  Widget ListShowNote(bool show)
  {
     list=fild01aController.items.where((element) => element.SHO_MB==show).toList();

    ////////////////////////////
    print('before');
    list.sort((a,b)=>a.SEQ_MB!.compareTo(b.SEQ_MB!));
    print('after');
    list.forEach((element) {print('${element.COL_VN}:${element.SEQ_MB}');});
    //list.sort((a,b)=>a.SEQ_MB!.compareTo(b.SEQ_MB!));
    return ReorderableListView.builder(itemBuilder: (context, index) {
      final item = list[index];

      return buildPayNote(index, item);
    }, itemCount: list.length, onReorder: (oldIndex, newIndex) => setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

      final user = list.removeAt(oldIndex);
      list.insert(index, user);

    //  var newitem=list[index];
    //  newitem.SEQ_MB=index;
    //  fild01aController.UpdateItem(newitem);
      for(int i=0;i<list.length;i++)
      {
        var item11=list[i];
        item11.SEQ_MB=(i+1);
        fild01aController.UpdateItem(item11);
      }
    }));
  }
  Widget buildPayNote(int index, FILD01A item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
        SmartDialog.show(builder: (_) {
          return Container(height: 180,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
            child: dlgPayNote(fild01a: item,),
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
      title: Text(item.COL_VN!),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5, ),
          Checkbox(value: item.SHO_MB, onChanged: (bool? value) {  },),
          Text('Format:${item.FormatString}'),
          SizedBox(width: 30,),
        ],
      ),
    ),);
  }

  Widget getListview()
  {
    var list=sysGroupController.items.toList();

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
        sysGroupController.UpdateItem(item);
      }
    }));
  }
  Widget buildUser(int index, sbmfrmSecurity_vs item) {
    return   Container(
      key: ValueKey(item),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)))
      ,child: ListTile(
      onTap: (){
        setState(() {
         // widget.fila07aa=item;
          //controller = TextEditingController(text: widget.item.SUB_NM);
          sysUserController.fetchProducts(item.GROUP_ID!);
          sysGroupDepController.fetchProducts(item.COM_ID!,item.GROUP_ID! );
          sysSecurityController.fetchProducts(item.GROUP_ID!);
          Get.to(FrmSecurity2( groupId: item.GROUP_ID!,));
        });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      leading: Container(width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.deepOrange),
        child: Center(child: Text('${index + 1}'),),),
      title: Text(item.GROUP_NM!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5, child: Container(color: Colors.black,),),
        ],
      ),
    ),);
  }
}

class dlgPayNote extends StatefulWidget
{
  FILD01A fild01a;
  dlgPayNote({Key?key,required this.fild01a}):super(key: key);
  @override
  _dlgPayNote createState()=> _dlgPayNote();

}
class _dlgPayNote extends State<dlgPayNote>
{
  bool is_active=false;
  final TextEditingController formatController = TextEditingController();
  final TextEditingController STTController = TextEditingController();
  Fild01aController fild01aController=Get.find();
  String? _formatstring='';
  int? _STT;
  @override
  void initState()
  {
    super.initState();
    is_active=widget.fild01a.SHO_MB!;
    formatController.text=widget.fild01a.FormatString.toString();
    _formatstring=widget.fild01a.FormatString.toString();

    STTController.text=widget.fild01a.SEQ_MB.toString();
    _STT=widget.fild01a.SEQ_MB;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        //Expanded(child: ClassdlgUpdateItemB( fila07aa: subfila07aController.items.where((element) => element.POS_ID==POS_ID && element.SUB_ID==SUB_ID).first))
        Expanded(child: Column(children: [
          SizedBox(height: 20,),
          Text(widget.fild01a.COL_VN!),
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

                  });
                },
              ),
              SizedBox(width: 10,),
              Container(width: 140,
                padding: const EdgeInsets.all(10),
                child: TextField(

                  controller: formatController,
                  decoration:  const InputDecoration(
                    labelText: 'FormatString',
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                  ),
                  onChanged: ((String v) {
                    setState(() {
                      _formatstring=v;
                    });
                  }
                  ),
                ),
              ),
              Container(width: 80,
                padding: const EdgeInsets.all(10),
                child: TextField(

                  controller: STTController,
                  decoration:  const InputDecoration(
                    labelText: 'STT',
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0)),
                  ),
                  onChanged: ((String v) {
                    setState(() {
                      print('v $v');
                      _STT=int.parse(v);
                    });
                  }
                  ),
                ),
              ),


              const SizedBox(width: 20,)
            ],
          )
        ],)),
        Container(height: 40,color: Colors.transparent,child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ButtonWidget(text: '同意', onClicked:() {

              widget.fild01a.SHO_MB=is_active;
              widget.fild01a.FormatString=_formatstring;
              widget.fild01a.SEQ_MB=_STT;
              fild01aController.UpdateItem(widget.fild01a);
              SmartDialog.dismiss();

            })
          ],),),
        SizedBox(height: 5,)
      ],
    );
  }

}