import 'package:flutter/material.dart';

import 'color_category.dart';

/////whiteContainer ==focusColor
class Themes {
  static final light = ThemeData.light().copyWith(
    bottomAppBarTheme: BottomAppBarTheme(color: regularBlack),
     scaffoldBackgroundColor: regularWhite,
    // backgroundColor: regularWhite,
    // // backgroundColor: lightThemebgColor,
    // // ignore: deprecated_member_use
    // buttonColor: Colors.cyan,
    // bottomAppBarColor: Colors.cyan,
    primaryColor: regularBlack,
    focusColor: lightThemeContainer,

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: regularBlack,
    //backgroundColor: regularBlack,
    primaryColor: regularWhite,
    focusColor: darkThemeContainer,
    //bottomAppBarColor: Colors.deepPurple,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
