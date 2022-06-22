import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ITheme.dart';

class DarkTheme extends ITheme {
  static DarkTheme? _instace;
  static DarkTheme get instance {
    if (_instace != null) return _instace!;
    _instace = DarkTheme._init();
    return _instace!;
  }

  DarkTheme._init();

  final ThemeData _darkTheme = ThemeData.dark();

  @override
  ThemeData get data => ThemeData(
        appBarTheme: _darkTheme.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          textTheme: _darkTheme.textTheme.apply(bodyColor: Colors.white),
          elevation: 0,
        ),
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        primaryColor: Colors.red,
        colorScheme: _darkTheme.colorScheme.copyWith(
          primary: Colors.white,
        ),
        textTheme: _darkTheme.textTheme.apply(
          bodyColor: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
          displayColor: Colors.white,
        ),

        /*tabBarTheme: TabBarTheme(
          labelColor: Colors.black, unselectedLabelColor: colors.codGray),*/
        //scaffoldBackgroundColor: colors.codGray,
        scaffoldBackgroundColor: Colors.transparent,
        floatingActionButtonTheme:
            _darkTheme.floatingActionButtonTheme.copyWith(
          backgroundColor: colors.mountainMeadow,
        ),
        bottomAppBarColor: colors.codGray,
      );
}
