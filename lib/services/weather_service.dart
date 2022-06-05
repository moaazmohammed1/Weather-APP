import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'https://www.metaweather.com/';

  Future<int> getCityId({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');

    http.Response response = await http.get(url);

    List<dynamic> jsonData = jsonDecode(response.body);
    int data = jsonData[0]['woeid'];

    return data;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      dynamic id = await getCityId(cityName: cityName);
      Uri url = Uri.parse('$baseUrl/api/location/$id/');
      http.Response response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Map<String, dynamic> data = jsonData['consolidated_weather'][0];
      String cityTitle = jsonData['title'];

      weatherData = WeatherModel.fromJson(data, cityTitle);
    } catch (e) {}
    return weatherData;
  }
}
