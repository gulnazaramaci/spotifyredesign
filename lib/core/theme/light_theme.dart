import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

import 'ITheme.dart';

class LightTheme extends ITheme {
  static LightTheme? _instace;
  static LightTheme get instance {
    if (_instace != null) return _instace!;
    _instace = LightTheme._init();
    return _instace!;
  }

  LightTheme._init();

  final ThemeData _lightTheme = ThemeData.light();

  @override
  ThemeData get data => ThemeData(
        appBarTheme: _lightTheme.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          textTheme: _lightTheme.textTheme.apply(bodyColor: Colors.white),
          elevation: 0,
        ),
        textTheme: _lightTheme.textTheme.apply(bodyColor: Colors.white),
        colorScheme: _lightTheme.colorScheme.copyWith(
          primary: Colors.white,
        ),
      );
}
