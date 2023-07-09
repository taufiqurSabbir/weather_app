import 'dart:convert';

import 'package:http/http.dart';

Future<Map<String,dynamic>> weatherdata(String location) async {
  const apiKey = "605325732f78f3467dd9c132b1dac803";
  final apiURL =
      "https://api.openweathermap.org/data/2.5/weather?units=metric&q=$location&appid=$apiKey";

  Response response = await get(Uri.parse(apiURL));


  if (response.statusCode == 200) {
    Map<String, dynamic> weatherMap = jsonDecode(response.body);
    return weatherMap;
  } else {
    throw Exception('Failed to load weather data');
  }
}