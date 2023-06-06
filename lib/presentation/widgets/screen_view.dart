import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? leading;
  const ScreenView(
      {super.key, required this.title, required this.body, this.leading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xff2C2F39)),
          ),
        ),
        elevation: 0,
        leading: leading,
      ),
      body: body,
    );
  }
}
