import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFE2E2FF);
  static Color mainColor = Color(0xFF00633);
  static Color accentColor = Color(0xFF0065FF);

  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.brown.shade100,
    Colors.deepPurple.shade100
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87);

  static TextStyle mainContent = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87);

  static TextStyle dateTitle = GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87);
}
