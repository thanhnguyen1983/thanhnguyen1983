import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/apiservice.dart';
import '../components/fild03a.dart';
import '../state/filb01acontroller.dart';
import '../utilities/languageservice.dart';
import '../utilities/utility.dart';

class ViewPayroll extends StatefulWidget
{
  @override
  _ViewPayrollState createState()=> _ViewPayrollState();
}
class _ViewPayrollState extends State<ViewPayroll>
{
  bool _isfirstshow=true;
  bool _isLoading = true;

  DateTime selectedDate = DateTime.now();
  Filb01aController filb01aController=Get.find();
  List<TableRow>? listb=<TableRow>[const TableRow(children: [Text(''),Text('')])];

  @override
  void initState() {
    super.initState();
    createTable();
    //loadDocument();
    //  _loadFile();
    // _downloadFile('http://192.168.1.35:5724/api/payrollResult?format=pdf','test.pdf');
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



    List<FILD03A> res=await ApiService.getFILD03A(filb01aController.items[0].EMP_ID!, LanguageService.defaultLanguage=='vn'?"VN":"CH" );

    //print(res);
  //  List<dynamic> body = jsonDecode(res);

    res.forEach((element) {

      var label,valuetb;

      label=element.SAL_NM;
      valuetb=element.SAL_VL;
      tableRows.add(TableRow(children:[textLbel(label),
        Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(valuetb??'')
        ],
        )
          ,]));//textNumber(valuetb,'#,##0.####')
    });

    setState(() => _isLoading = false);
    listb= tableRows;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(LanguageService.MNU_07),

        //  actions: [IconButton(icon:Icon(Icons.add),onPressed:()=> _downloadFile('http://192.168.1.35:5724/api/payrollResult?format=pdf','test.pdf'),)],
      ),
      body:Column(
        children:<Widget> [

          Expanded(child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child:(_isfirstshow==false && _isLoading) ? const Center(child: CircularProgressIndicator()) :
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