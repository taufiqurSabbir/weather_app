import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor mycolor = const MaterialColor(
    0xFF7C51FE,
    <int, Color>{
      50: const Color(0xFF7C51FE),
      100: const Color(0xFF7C51FE),
      200: const Color(0xFF7C51FE),
      300: const Color(0xFF7C51FE),
      400: const Color(0xFF7C51FE),
      500: const Color(0xFF7C51FE),
      600: const Color(0xFF7C51FE),
      700: const Color(0xFF7C51FE),
      800: const Color(0xFF7C51FE),
      900: const Color(0xFF7C51FE),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: const HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: mycolor,
      ),
    );
  }
}
