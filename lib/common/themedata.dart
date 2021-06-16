import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

bool _darkMode() {
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  bool darkModeOn = brightness == Brightness.dark;
  return darkModeOn;
}

bool mode = _darkMode();

ThemeData themeDataDark = ThemeData(
    primaryColor: Colors.blue[900],
    textTheme: TextTheme(
      subtitle1: GoogleFonts.mulish(fontSize: 13, color: Colors.white),
      headline6: GoogleFonts.mulish(fontSize: 16, color: Colors.white),
      headline5: GoogleFonts.mulish(fontSize: 20, color: Colors.white),
      headline4: GoogleFonts.mulish(
        fontSize: 18,
        color: Colors.white,
      ),
      subtitle2: GoogleFonts.mulish( fontWeight: FontWeight.bold, color: Colors.white),
    ),
    focusColor: Colors.white,
    // color: mode ? Colors.white : Colors.black ,
    buttonColor: Colors.white,
    canvasColor: Colors.grey[900],
    cardColor: Colors.grey[700],
    shadowColor: Colors.white70,
    hintColor: Colors.grey[900],
    iconTheme: IconThemeData(color: Colors.white));


ThemeData themeData = ThemeData(
    primaryColor: Colors.blue[900],
    textTheme: TextTheme(
      subtitle1: GoogleFonts.mulish(fontSize: 13, color: Colors.black87),
      headline6: GoogleFonts.mulish(fontSize: 16, color: Colors.black87),
      headline5: GoogleFonts.mulish(fontSize: 20, color: Colors.black87),
      headline4: GoogleFonts.mulish(
        fontSize: 18,
        color: Colors.black87,
      ),
      subtitle2: GoogleFonts.mulish( fontWeight: FontWeight.bold, color: Colors.black87),
    ),
    focusColor: Colors.black87,
    // color: mode ? Colors.white : Colors.black ,
    buttonColor: Colors.blue[900],
    // canvasColor: Colors.white70,
    // cardColor: Colors.grey[700],
    // shadowColor: Colors.white70,
    hintColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black87));