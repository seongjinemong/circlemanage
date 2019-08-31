import 'package:flutter/material.dart';
import 'package:circlemanage/login/login.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(48, 213, 200, .1),
  100: Color.fromRGBO(48, 213, 200, .2),
  200: Color.fromRGBO(48, 213, 200, .3),
  300: Color.fromRGBO(48, 213, 200, .4),
  400: Color.fromRGBO(48, 213, 200, .5),
  500: Color.fromRGBO(48, 213, 200, .6),
  600: Color.fromRGBO(48, 213, 200, .7),
  700: Color.fromRGBO(48, 213, 200, .8),
  800: Color.fromRGBO(48, 213, 200, .9),
  900: Color.fromRGBO(48, 213, 200, 1),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor myColor = MaterialColor(0xFF880E4F, color);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: myColor,
        primaryColor: Colors.cyan,
        accentColor: Colors.cyanAccent,
      ),
      home: LoginPage(),
    );
  }
}
