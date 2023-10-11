import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'package:humanweb/api/apiservice.dart';
import 'package:humanweb/components/fild01a.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';

import 'package:humanweb/utilities/utility.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';


import 'package:path_provider/path_provider.dart';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:get/get.dart';
class ViewPayrollMonth extends StatefulWidget
{
  @override
  _ViewPayrollMonthState createState()=> _ViewPayrollMonthState();
}
class _ViewPayrollMonthState extends State<ViewPayrollMonth>
{
  bool _firstshow=true;
  bool _isLoading = true;
  bool _hideprocess=true;
   PDFDocument? document;
  DateTime selectedDate = DateTime.now();
  Filb01aController filb01aController=Get.find();
  List<TableRow>? listb=<TableRow>[const TableRow(children: [Text(''),Text('')])];

  @override
  void initState() {
    super.initState();
    //loadDocument();
  //  _loadFile();
   // _downloadFile('http://192.168.1.35:5724/api/payrollResult?format=pdf','test.pdf');
  }


  loadDocument() async {
    document = await PDFDocument.fromAsset('images/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {


      var filename='${Utility.datetoStringFormat(selectedDate, 'yyyyMM')}_${filb01aController.items[0].EMP_ID!}';


      http.Client client =  http.Client();
      var req = await client.get(Uri.parse('${kApiurl}payrollResult?FileName=$filename'));
      var bytes = req.bodyBytes;
      String dir = (await getApplicationDocumentsDirectory()).path;
      io.File file =  io.File('$dir/$filename.pdf');


      await file.writeAsBytes(bytes);


      document = await PDFDocument.fromFile(file);

       //_downloadFile('http://192.168.1.35:5724/api/payrollResult?FileName=$filename','$filename.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }
  Widget textNumber(Object value,String format)
  {
    return Container(alignment: Alignment.center,padding: const EdgeInsets.all(10),child: Text(Utility.numbertoStringFormat(value, format)));
  }
  Widget textLbel(String value)
  {
    return Container(color: Colors.grey[300],padding: const EdgeInsets.all(10),child: Text(value));
  }
   createTable()async{

    List<TableRow> tableRows = [];

  setState(() => _isLoading = true);



  String res=await ApiService.getFILD02A(filb01aController.items[0].EMP_ID!, Utility.datetoStringFormat(selectedDate, 'yyyyMM'));

  print(res);
  List<dynamic> body = jsonDecode(res);

  body.forEach((element) {

    var label,valuetb;

    element.forEach((key, value){
        print('key:$key,value:$value');
      if(LanguageService.defaultLanguage=='vn' && key=="COL_VN") {
        label=value??'';
      }
      if(LanguageService.defaultLanguage=='ch' && key=="COL_CH") {
        label=value??'';
      }
      if(key=='COL_TT') {
        valuetb=value??0;
      }


    });
    tableRows.add(TableRow(children:[textLbel(label),
        Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(valuetb??'')
            ],)
        ]));//textNumber(valuetb,'#,##0.####')
  });

  setState(() => _isLoading = false);
    listb= tableRows;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LanguageService.MNU_06),
          actions: [
            IconButton(onPressed: (){_selectDate(context);}, icon: const Icon(Icons.search))
          ]
      //  actions: [IconButton(icon:Icon(Icons.add),onPressed:()=> _downloadFile('http://192.168.1.35:5724/api/payrollResult?format=pdf','test.pdf'),)],
      ),
      body:Column(
        children:<Widget> [
          Container(alignment: Alignment.center,padding: const EdgeInsets.all(2),margin: const EdgeInsets.all(2),decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(10)),height: 27,child:  InkWell(onTap: (){
            _selectDate(context);
          },
            child: Text('${LanguageService.MON_DR}: ${Utility.datetoStringFormat(selectedDate, 'MM/yyyy')}'),
          ),),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child:(_firstshow==false && _isLoading) ? const Center(child: CircularProgressIndicator()) :
              SingleChildScrollView(
                padding: const EdgeInsets.all(5),
                child: Table(
                  columnWidths: const {0:FixedColumnWidth(200)},
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: const TableBorder(horizontalInside: BorderSide(width: 1,color: Colors.blue,style: BorderStyle.solid)),
                  children: listb!,
                ),
              )

              ,
            ),
          )),
        ],
      ),
    );
  }


  /*
  Center(child: _isLoading ? const Center(child: CircularProgressIndicator()) : PDFViewer(document: _pdf)),
  */
  Future<void> _selectDate(BuildContext context) async {

  print('showMonthPicker');

  final pickedDate = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2050)
  );


   /* final  pickedDate = await showMonthPicker(
        locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
*/

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(()  {
        selectedDate = pickedDate;
        _firstshow=false;
        createTable();
      });
    }
  }


  void _downloadFile(String url, String filename) async {
    http.Client client =  http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    io.File file =  io.File('$dir/$filename');


    await file.writeAsBytes(bytes);


    document = await PDFDocument.fromFile(file);

    setState(() {
      _isLoading = false;
    });



  }


  // Future<File> _downloadFile(String url, String filename) async {
  //   http.Client client =  http.Client();
  //   var req = await client.get(Uri.parse(url));
  //   var bytes = req.bodyBytes;
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file =  File('$dir/$filename');
  //   await file.writeAsBytes(bytes);
  //   return file;
  // }
}