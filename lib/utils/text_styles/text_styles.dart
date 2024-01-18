// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

const FontWeight _light = FontWeight.w300;
const FontWeight _regular = FontWeight.w400;
const FontWeight _medium = FontWeight.w500;
const FontWeight _bold = FontWeight.w700;
const FontWeight _extraBold = FontWeight.w900;
TextStyle _poppins = GoogleFonts.poppins();
TextStyle aBeeZee = GoogleFonts.aBeeZee();
TextStyle _ptSans = GoogleFonts.ptSans();
// Naming: Camelcase
// FontWeight..fontclass..Size..Color
// normal18Red3c

class TextStyles {
  static TextStyle headline1 = TextStyle(
      fontSize: 31,
      fontWeight: FontWeight.w700,
      color: KColor.black,
      fontFamily: _poppins.fontFamily);

  static TextStyle headline2 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: KColor.black,
      fontFamily: aBeeZee.fontFamily);

  static TextStyle headline3 = TextStyle(
    fontSize: 22,
    fontFamily: aBeeZee.fontFamily,
    fontWeight: FontWeight.w700,
    color: KColor.black,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    fontFamily: aBeeZee.fontFamily,
    color: KColor.black,
  );
  static TextStyle headline5 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: KColor.black,
      fontFamily: aBeeZee.fontFamily);

  static TextStyle headline6 = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: KColor.black,
      fontFamily: aBeeZee.fontFamily);

  static TextStyle appBarText = TextStyle(
      fontWeight: FontWeight.w600,
      color: KColor.black,
      fontSize: 16,
      fontFamily: aBeeZee.fontFamily);
  static TextStyle mediumPoppins24white = TextStyle(
      fontWeight: _medium, fontSize: 18, fontFamily: aBeeZee.fontFamily);

  static TextStyle bodyText1 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: KColor.black,
      fontFamily: aBeeZee.fontFamily);

  static TextStyle bodyText2 = TextStyle(
      fontWeight: FontWeight.w400,
      color: KColor.black,
      fontSize: 14,
      fontFamily: aBeeZee.fontFamily);
  static TextStyle bodyText3 = TextStyle(
      fontWeight: FontWeight.w400,
      color: KColor.black,
      fontSize: 12,
      fontFamily: aBeeZee.fontFamily);
  static TextStyle subTitle = TextStyle(
      fontWeight: FontWeight.w600,
      color: KColor.black,
      fontSize: 18,
      fontFamily: aBeeZee.fontFamily);
}
