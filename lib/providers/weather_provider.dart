import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? Weather) {
    _weatherData = Weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;

}
