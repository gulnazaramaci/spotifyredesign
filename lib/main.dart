import 'package:flutter/material.dart';
import 'package:spotifyredesign/view/index_view.dart';
import 'package:spotifyredesign/view/login_view.dart';
//import 'package:spotifyredesign/view/test.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: DarkTheme.instance.data,
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => IndexView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginView(),
      },
      //home: LoginView(),
    );
  }
}
