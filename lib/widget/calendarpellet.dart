import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanweb/utilities/constants.dart';
class CalendarPellet extends StatefulWidget {
  final String text;
  final String subText;
  final Color color;
  CalendarPellet({
    required this.color,
    required this.subText,
    required this.text,
  });
  @override
  _CalendarPelletState createState() => _CalendarPelletState();
}
class _CalendarPelletState extends State<CalendarPellet> {
  bool exit = true;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          exit = false;
        });
      },
      onExit: (v) {
        setState(() {
          exit = true;
        });
      },
      child: AnimatedContainer(
          height: (exit && widget.text!=returnWeekDay()) ? 60.0 : 75.0,
          width: (exit && widget.text!=returnWeekDay()) ? 40.0 : 45.0,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: (exit && widget.text!=returnWeekDay()) ? Colors.white : color3,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: (exit && widget.text!=returnWeekDay())
            ? []
                : [
            const BoxShadow(
            color: color3,
            blurRadius: 10.0,
          ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.nunitoSans(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: (exit && widget.text!=returnWeekDay()) ? const Color(0xff45417C) : Colors.white),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            widget.subText,
            style: GoogleFonts.nunitoSans(
              color: (exit && widget.text!=returnWeekDay()) ? Colors.black87 : Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Container(
            height: 4.0,
            width: 4.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: (exit && widget.text!=returnWeekDay()) ? widget.color : Colors.white,
            ),
          )
        ],
      ),
    ),
    );
  }

  String returnWeekDay()
  {
    String? day;
    switch(DateTime.now().weekday)
    {
      case DateTime.monday:
        day='Mon';
        break;
      case DateTime.tuesday:
        day='Tue';
        break;
      case DateTime.wednesday:
        day='Wed';
        break;
      case DateTime.thursday:
        day='Thu';
        break;
      case DateTime.friday:
        day='Fri';
        break;
      case DateTime.saturday:
        day='Sat';
        break;
      case DateTime.sunday:
        day='Sun';
        break;
    }
    //print(day!);
    return day!;

  }

}