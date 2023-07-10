import 'dart:convert';

import 'package:http/http.dart';

class weather {
  final double temp, feelsLike, low, high;
  final String description, name, icon;

  weather(this.temp, this.feelsLike, this.low, this.high, this.description,
      this.name, this.icon);

  factory weather.fromJson(Map<String, dynamic> e) {
    return weather(
      e['main']['temp'],
      e['main']['feels_like'],
      e['main']['temp_min'],
      e['main']['temp_max'],
      e['weather'][0]['main'],
      e['name'],
      e['weather'][0]['icon'],
    );
  }
}
