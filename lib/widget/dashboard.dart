import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanweb/components/SYS_GROUP.dart';
import 'package:humanweb/presentation/character_list_screen.dart';
import 'package:humanweb/state/dashboardcontroller.dart';
import 'package:humanweb/state/filb01acontroller.dart';
import 'package:humanweb/state/systemcontroller.dart';
import 'package:humanweb/utilities/constants.dart';
import 'package:humanweb/utilities/languageservice.dart';
import 'package:humanweb/utilities/utility.dart';
import 'package:humanweb/view/viewvacationapproval.dart';
import 'package:humanweb/widget/weeklyreportcards.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';


//import 'package:month_picker_dialog_2/month_picker_dialog.dart';
import '../components/filb01a.dart';
import '../page/frmSecurity.dart';
import '../page/myhomepage.dart';
import '../state/filc04aacontroller.dart';
import 'calendarpellet.dart';
import 'package:intl/intl.dart';
class Dashboard extends StatefulWidget
{
  const Dashboard({Key? key}) : super(key: key);


  @override
  _DashboardState createState()=> _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  DateTime selectedDate = DateTime.now();
  SystemController stateSystem = Get.find();
  Filb01aController filb01aController=Get.find();
  DashBoardController dashBoardController=Get.put(DashBoardController());

  Filc04aaController filc04aaController=Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    stateSystem.isadmin.value=true;
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: ()
              {

                filb01aController.addItem(<FILB01A>[filb01aController.items[0]]);
                Get.to(MyHomePage());
              },
              child:  Container(

                margin: const EdgeInsets.only(top: 5.0),
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${stateSystem.username}!',
                            style: GoogleFonts.raleway(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Welcome Back Humanresouce Manager',
                            style: GoogleFonts.quicksand(
                                fontSize: 15.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //Image.asset('images/abc.png', fit: BoxFit.fill,),
                  ],
                ),
              ),
            )
           ,
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Text(
                  Utility.datetoStringFormat(
                      stateSystem.selectedDate.value, 'MM/yyyy'),
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.0,
                    color: mainTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 20.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white54,
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                 IconButton(
                  icon: const Icon(Icons.settings, size: 15,),
                  color: mainTextColor,
                  onPressed: () {
                    if(stateSystem.GROUP_ID.toString()=="admin" || stateSystem.GROUP_ID.toString()=="Admin" || stateSystem.GROUP_ID.toString()=="administrators") {
                      Get.to(FrmSecurity());
                    }
                      }
                  ,),
                Container(
                  height: 32.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: monthButtonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today, size: 15,),
                        color: mainTextColor,
                        onPressed: () => _selectDate(context),),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(LanguageService.MON_DR, style: GoogleFonts.nunitoSans(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            Container(
              height: 75.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalendarPellet(
                    text: 'Mon',
                    subText: '${returnDay(DateTime.now(), 'Mon')}',
                    color: color1,
                  ),
                  CalendarPellet(
                    text: 'Tue',
                    subText: '${returnDay(DateTime.now(), 'Tue')}',
                    color: color2,
                  ),
                  CalendarPellet(
                    text: 'Wed',
                    subText: '${returnDay(DateTime.now(), 'Wed')}',
                    color: color3,
                  ),
                  CalendarPellet(
                    text: 'Thu',
                    subText: '${returnDay(DateTime.now(), 'Thu')}',
                    color: color4,
                  ),
                  CalendarPellet(
                    text: 'Fri',
                    subText: '${returnDay(DateTime.now(), 'Fri')}',
                    color: color1,
                  ),
                  CalendarPellet(
                    text: 'Sat',
                    subText: '${returnDay(DateTime.now(), 'Sat')}',
                    color: color2,
                  ),
                  CalendarPellet(
                    text: 'Sun',
                    subText: '${returnDay(DateTime.now(), 'Sun')}',
                    color: color3,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Text(
                    LanguageService.MonthlyReports,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.0,
                      color: mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),


                // InkWell(
                //   onTap: () {
                //     stateSystem.isLastMonth(true);
                //   },
                //   child:
                //       Text(
                //         'Last Month',
                //         style: GoogleFonts.nunitoSans(
                //           fontSize: 12.0,
                //           color: stateSystem.isLastMonth.isTrue
                //               ? mainTextColor
                //               : Colors.black45,
                //           fontWeight: stateSystem.isLastMonth.isTrue
                //               ? FontWeight.w700
                //               : FontWeight.normal,
                //
                //         ),
                //       ),
                // ),
                // const SizedBox(width: 10.0),
                // InkWell(
                //   onTap: () {
                //     stateSystem.isLastMonth(false);
                //   },
                //   child: Obx(() =>
                //       Text(
                //           'Month',
                //           style: GoogleFonts.nunitoSans(
                //             fontSize: 12.0,
                //             color: stateSystem.isLastMonth.isTrue ? Colors
                //                 .black45 : mainTextColor,
                //             fontWeight: stateSystem.isLastMonth.isTrue
                //                 ? FontWeight.normal
                //                 : FontWeight.w700,
                //           )),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Obx(() => Container(
              height: 140.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell( onTap: (){
                    stateSystem.STY.value=1;
                    Get.to(CharacterListScreen(title:LanguageService.totalstaff));
                  },child:WeeklyReportCards(
                  text: LanguageService.totalstaff,
                  buttonText: dashBoardController.isLoading.isTrue?'0':'${dashBoardController.item!.totalStaff}',
                  color: color1,
                  icon: Icons.group,
                ))

                  ,
                  InkWell(
                    onTap: (){
                      stateSystem.STY.value=2;
                      Get.to(CharacterListScreen(title:LanguageService.newinmonth));
                    },
                  child:WeeklyReportCards(
                    text: LanguageService.newinmonth,
                    buttonText: dashBoardController.isLoading.isTrue?'0':'${dashBoardController.item!.newsStaff}',
                    color: color3,
                    icon: Icons.person,
                  )),

              InkWell(
                onTap: (){
                  stateSystem.STY.value=3;
                  Get.to(CharacterListScreen(title:LanguageService.offinmonth));
                },
                child:WeeklyReportCards(
                    text: LanguageService.offinmonth,
                    buttonText: dashBoardController.isLoading.isTrue?'0':'${returnOffCurrent(stateSystem.selectedDate.value)}',
                    color: color2,
                    icon: Icons.person,
                  )),
              /*
              InkWell(
                onTap: (){
                  stateSystem.STY.value=4;
                  Get.to(CharacterListScreen(title:LanguageService.needcontract));
                },
                child:WeeklyReportCards(
                    text: LanguageService.needcontract,
                    buttonText: dashBoardController.isLoading.isTrue?'0':'${dashBoardController.item!.needContract}',
                    color: color4,
                    icon: Icons.contact_page_outlined,
                  )),
                  */
                  InkWell(
                    onTap: (){


                     // Get.to(FrmSecurity());

                      Get.to(ViewVacationApproval());



                    },
                      child:WeeklyReportCards(
                        text: LanguageService.APV_N1,
                        buttonText: dashBoardController.isLoading.isTrue?'0':'${filc04aaController.items.length}',
                        color: color2,
                        icon: Icons.person,
                      )),

                ],
              ),
            )) ,
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            // Padding(
            //   padding: EdgeInsets.all(5),
            //   child: Column(
            //     children: ListDepartment(),
            //   ),
            // ),
            returnChart(),
          ],
        ),
      ),
    ); Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${filb01aController.items[0].EMP_ID}!',
                          style: GoogleFonts.raleway(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Welcome Back Humanresouce Manager',
                          style: GoogleFonts.quicksand(
                              fontSize: 15.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //Image.asset('images/abc.png', fit: BoxFit.fill,),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Text(
                  Utility.datetoStringFormat(
                      stateSystem.selectedDate.value, 'dd/MM/yyyy'),
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16.0,
                    color: mainTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 20.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white54,
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 32.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: monthButtonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today, size: 15,),
                        color: mainTextColor,
                        onPressed: () => _selectDate(context),),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text('Month', style: GoogleFonts.nunitoSans(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            Container(
              height: 75.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalendarPellet(
                    text: 'Mon',
                    subText: '${returnDay(DateTime.now(), 'Mon')}',
                    color: color1,
                  ),
                  CalendarPellet(
                    text: 'Tue',
                    subText: '${returnDay(DateTime.now(), 'Tue')}',
                    color: color2,
                  ),
                  CalendarPellet(
                    text: 'Wed',
                    subText: '${returnDay(DateTime.now(), 'Wed')}',
                    color: color3,
                  ),
                  CalendarPellet(
                    text: 'Thu',
                    subText: '${returnDay(DateTime.now(), 'Thu')}',
                    color: color4,
                  ),
                  CalendarPellet(
                    text: 'Fri',
                    subText: '${returnDay(DateTime.now(), 'Fri')}',
                    color: color1,
                  ),
                  CalendarPellet(
                    text: 'Sat',
                    subText: '${returnDay(DateTime.now(), 'Sat')}',
                    color: color2,
                  ),
                  CalendarPellet(
                    text: 'Sun',
                    subText: '${returnDay(DateTime.now(), 'Sun')}',
                    color: color3,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Text(
                    'Monthly Reports',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.0,
                      color: mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),


                InkWell(
                  onTap: () {
                    stateSystem.isLastMonth(true);
                  },
                  child: Obx(() =>
                      Text(
                        'Last Month',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12.0,
                          color: stateSystem.isLastMonth.isTrue
                              ? mainTextColor
                              : Colors.black45,
                          fontWeight: stateSystem.isLastMonth.isTrue
                              ? FontWeight.w700
                              : FontWeight.normal,

                        ),
                      )),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    stateSystem.isLastMonth(false);
                  },
                  child: Obx(() =>
                      Text(
                          'Month',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12.0,
                            color: stateSystem.isLastMonth.isTrue ? Colors
                                .black45 : mainTextColor,
                            fontWeight: stateSystem.isLastMonth.isTrue
                                ? FontWeight.normal
                                : FontWeight.w700,
                          )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              height: 140.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeeklyReportCards(
                    text: 'Total',
                    buttonText: '${dashBoardController.items[0].totalStaff}',
                    color: color1,
                    icon: Icons.group,
                  ),
                  WeeklyReportCards(
                    text: 'New Staff',
                    buttonText: '${dashBoardController.items[0].newsStaff}',
                    color: color3,
                    icon: Icons.person,
                  ),
                  WeeklyReportCards(
                    text: 'Staff Off',
                    buttonText: '${returnOffCurrent(stateSystem.selectedDate.value)}',
                    color: color2,
                    icon: Icons.person,
                  ),
                  WeeklyReportCards(
                    text: 'Need Contract',
                    buttonText: '${dashBoardController.items[0].needContract}',
                    color: color4,
                    icon: Icons.contact_page_outlined,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
              height: 1.0,
              color: Colors.black12,
            ),
            // Padding(
            //   padding: EdgeInsets.all(5),
            //   child: Column(
            //     children: ListDepartment(),
            //   ),
            // ),
            returnChart(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showMonthPicker(
        //locale: const Locale('en'),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        stateSystem.selectedDate(selectedDate);
        stateSystem.YYYY.value=selectedDate.year.toString();
        stateSystem.MM.value=selectedDate.month.toString();

        dashBoardController.fetchProducts(selectedDate.year, selectedDate.month);
      });
    }
  }

  int returnDay(DateTime dt, String compare) {
    int currentDay = dt.weekday;
    DateTime? firstDayOfWeek;
    switch (compare) {
      case "Mon":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 1));
        break;
      case "Tue":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay-2));
        break;
      case "Wed":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 3));
        break;
      case "Thu":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 4));
        break;
      case "Fri":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 5));
        break;
      case "Sat":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 6));
        break;
      case "Sun":
        firstDayOfWeek = dt.subtract(Duration(days: currentDay - 7));
        break;
    }
    return firstDayOfWeek!.day;
  }

  List<Widget> ListDepartment()
  {
    List<Widget> list=[];
    var toptitle=Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: const Text('Salary'),
      height: 30,
      decoration: const BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.only(topLeft:  Radius.circular(10),topRight: Radius.circular(10))),
    );
    list.add(toptitle);

    var detail=Container(
      height: 30,
      child: Row(
        children: const [
          Text('bo phan '),
          Text('So Luong'),
          Text('Tong Luong'),
          Text('Luong TB'),
        ],
      ),
    );
    list.add(detail);
    var detail1=Container(
      height: 30,
      child: Row(
        children: const [
          Text('bo phan thanh hinh'),
          Text('12'),
          Text('302.000.000'),
          Text('18.000.000'),
        ],
      ),
    );
    list.add(detail1);
    var detail2=Container(
      height: 30,
      child: Row(
        children: const [
          Text('bo phan nhan su'),
          Text('123'),
          Text('500.000.000'),
          Text('12.000.000'),
        ],
      ),
    );
    list.add(detail2);
    var endtitle=Container(
      height: 30,
      decoration: const BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(10),bottomRight: Radius.circular(10))),
    );

    list.add(endtitle);

    return list;
  }

  int returnOffCurrent(DateTime dt)
  {
    int count=0;
    switch(dt.month)
    {
      case 1:
        count=dashBoardController.items[0].off01!;
        break;
      case 2:
        count=dashBoardController.items[0].off02!;
        break;
      case 3:
        count=dashBoardController.items[0].off03!;
        break;
      case 4:
        count=dashBoardController.items[0].off04!;
        break;
      case 5:
        count=dashBoardController.items[0].off05!;
        break;
      case 6:
        count=dashBoardController.items[0].off06!;
        break;
      case 7:
        count=dashBoardController.items[0].off07!;
        break;
      case 8:
        count=dashBoardController.items[0].off08!;
        break;
      case 9:
        count=dashBoardController.items[0].off09!;
        break;
      case 10:
        count=dashBoardController.items[0].off10!;
        break;
      case 11:
        count=dashBoardController.items[0].off11!;
        break;
      case 12:
        count=dashBoardController.items[0].off12!;
        break;
    }

    print('count $count');
    return count;
  }

  Widget returnChart()
  {
    return Container(
      height: 190.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(()=>
                  Text(
                    '${LanguageService.Current} / ${stateSystem.selectedDate.value.month}',
                    style: const TextStyle(
                      fontSize: 9.0,
                      color: Colors.black,
                    ),
                  )),
                //   Obx(()=>Text(dashBoardController.isLoading.isTrue?'0%': '${((returnOffCurrent(stateSystem.selectedDate.value)/dashBoardController.item!.maxoff! )*100).toInt()}%',

                ],
              ),
              Container(
                width: 60.0,
                height: 30.0,
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(
                      color: rightSideBackColor, width: 2.0),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: color1,
                          borderRadius:
                          BorderRadius.circular(5.0),
                        ),
                        child: const Icon(
                          Icons.bar_chart_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(7.0),
                        ),
                        child: const Icon(
                          Icons.stacked_line_chart_rounded,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 13.0,
          ),
          Obx(() =>  Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChartBar('1',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off01!,stateSystem.selectedDate.value.month==1 ? color1:color2, dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off01==0 ?0:(dashBoardController.item!.off01!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('2',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off02!,stateSystem.selectedDate.value.month==2 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off02==0 ?0:(dashBoardController.item!.off02!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('3',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off03!,stateSystem.selectedDate.value.month==3 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off03==0 ?0:(dashBoardController.item!.off03!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('4',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off04!,stateSystem.selectedDate.value.month==4 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off04==0 ?0:(dashBoardController.item!.off04!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('5',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off05!,stateSystem.selectedDate.value.month==5 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off05==0 ?0:(dashBoardController.item!.off05!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('6',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off06!,stateSystem.selectedDate.value.month==6 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off06==0 ?0:(dashBoardController.item!.off06!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('7',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off07!,stateSystem.selectedDate.value.month==7 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off07==0 ?0:(dashBoardController.item!.off07!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('8',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off08!,stateSystem.selectedDate.value.month==8 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off08==0 ?0:(dashBoardController.item!.off08!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('9',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off09!,stateSystem.selectedDate.value.month==9 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off09==0 ?0:(dashBoardController.item!.off09!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('10',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off10!,stateSystem.selectedDate.value.month==10 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off10==0 ?0:(dashBoardController.item!.off10!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('11',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off11!,stateSystem.selectedDate.value.month==11 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off11==0 ?0:(dashBoardController.item!.off11!/dashBoardController.item!.maxoff!)*100)),
              ChartBar('12',dashBoardController.isLoading.isTrue ? 0:dashBoardController.item!.off12!,stateSystem.selectedDate.value.month==12 ? color1:color2,dashBoardController.isLoading.isTrue ? 0: (dashBoardController.item!.off12==0 ?0:(dashBoardController.item!.off12!/dashBoardController.item!.maxoff!)*100)),

            ],
          )),
        ],
      ),
    );
  }

}



/*
class ChartBar extends StatelessWidget {
  final String day;
  final int value;
  final Color color;
  final double percent;
  ChartBar(this.day, this.value, this.color,this.percent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 9.0,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 100.0,
          width: 7.0,
          decoration: BoxDecoration(
            color: rightSideBackColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: percent??0,
            width: 5.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          day,
          style: const TextStyle(
            fontSize: 9.0,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
*/

class ChartBar extends StatelessWidget {
  final String day;
  final int value;
  final Color color;
  final double percent;
  ChartBar(this.day, this.value, this.color,this.percent);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        direction: Axis.vertical,
        children: [
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 9.0,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 100.0,
            width: 7.0,
            decoration: BoxDecoration(
              color: rightSideBackColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: percent??0,
              width: 5.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            day,
            style: const TextStyle(
              fontSize: 9.0,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class OtherFunctionPellet extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  OtherFunctionPellet({
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 45.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  const Icon(Icons.toggle_on),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}