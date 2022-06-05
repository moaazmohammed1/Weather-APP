import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime applicableDate;
  double theTemp;
  int maxTemp;
  int minTemp;
  String cityTitle;

  WeatherModel(
      {required this.theTemp,
      required this.weatherStateName,
      required this.applicableDate,
      required this.maxTemp,
      required this.minTemp,
      required this.cityTitle,
      });

  factory WeatherModel.fromJson(Map<String, dynamic> data, String title) {
    return WeatherModel(
      theTemp: data["the_temp"],
      weatherStateName: data['weather_state_name'],
      applicableDate: DateTime.parse(data['created']),
      maxTemp: data['max_temp'].round(),
      minTemp: data['min_temp'].round(),
      cityTitle: title,
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers ') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.yellow;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.blue;
    } else {
      return Colors.amber;
    }
  }
}
