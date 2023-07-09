import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherdata('Rangpur');
  }

  Future<void> weatherdata(String location) async {
    const apiKey = "605325732f78f3467dd9c132b1dac803";
    final apiURL =
        "https://api.openweathermap.org/data/2.5/weather?units=metric&q=$location&appid=$apiKey";

    Response response = await get(Uri.parse(apiURL));
    print(response.body);

    // if (response.statusCode == 200) {
    //   Map<String, dynamic> weatherData = jsonDecode(response.body);
    //   print(weatherData);
    // } else {
    //   print('Failed to fetch weather data');
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
