import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanweb/utilities/constants.dart';
class WeeklyReportCards extends StatefulWidget {
  final String text;
  final Color color;
  final String buttonText;
  final IconData icon;
  WeeklyReportCards({
    required this.buttonText,
    required this.color,
    required this.text,
    required this.icon,
  });
  @override
  _WeeklyReportCardsState createState() => _WeeklyReportCardsState();
}

class _WeeklyReportCardsState extends State<WeeklyReportCards> {
  bool exit = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          exit = false;
        });
      },
      onExit: (value) {
        setState(() {
          exit = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: exit ? 110.0 : 130.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: exit ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: exit ? Colors.black12 : Colors.transparent,
          ),
          boxShadow: exit
          ? []
              : [
          BoxShadow(
          spreadRadius: 1.0,
          blurRadius: 20.0,
          color: Colors.grey[200]!,
        ),
        ],
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(top: 15.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: !exit ? Colors.transparent : widget.color,
                ),
                color: !exit ? widget.color : Colors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Icon(
              widget.icon,
              size: 16.0,
              color: !exit ? Colors.white : widget.color,
            ),
          ),
          const Spacer(),
          Text(
            widget.text,
            style: GoogleFonts.nunitoSans(
              fontSize: 13.0,
              color: mainTextColor,
            ),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(backgroundColor:exit ? Colors.transparent : widget.color),

            onPressed: () {},

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: exit ? 35 : 45.0,
              width: 90.0,
              child: Center(
                child: Text(
                  widget.buttonText,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: exit ? mainTextColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    ),
    );
  }
}