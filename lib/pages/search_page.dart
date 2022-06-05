import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 253),
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        margin:
            const EdgeInsets.only(left: 20, right: 20, top: 260, bottom: 20),
        child: TextField(
          onChanged: (data){
            cityName = data;
          },
          onSubmitted: (data) async {
            cityName = data;
            WeatherServices services = WeatherServices();
            WeatherModel? Weather =
                await services.getWeather(cityName: '$cityName');

            Provider.of<WeatherProvider>(context, listen: false).weatherData =
                Weather;
            // updateUi!();
            Navigator.pop(context);
          },
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 16, right: 18, top: 17, bottom: 17),
            label: Text('Search *'),
            labelStyle:
                const TextStyle(height: 1, fontSize: 19, fontWeight: FontWeight.bold),
            suffixIcon: GestureDetector(
              onTap: () async{
                WeatherServices services = WeatherServices();
                WeatherModel? Weather =
                await services.getWeather(cityName: '$cityName');

                Provider.of<WeatherProvider>(context, listen: false).weatherData =
                    Weather;
                // updateUi!();
                Navigator.pop(context);
              },
              child: const Icon(Icons.search),
            ),
            hintText: 'Enter A City',
            hintStyle:
                const TextStyle(height: 2, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
