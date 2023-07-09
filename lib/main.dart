import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';

import 'Style/style.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MaterialColor mycolor = MaterialColor(0xFF7C51FE, <int, Color>{
    50: Color(0xFF7C51FE),
    100: Color(0xFF7C51FE),
    200: Color(0xFF7C51FE),
    300: Color(0xFF7C51FE),
    400: Color(0xFF7C51FE),
    500: Color(0xFF7C51FE),
    600: Color(0xFF7C51FE),
    700: Color(0xFF7C51FE),
    800: Color(0xFF7C51FE),
    900: Color(0xFF7C51FE),
  },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: mycolor,
      ),
    );
  }
}


