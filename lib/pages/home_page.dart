import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is No Weather 😔 Start',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Searching 🔍 Now',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[400]!,
                    weatherData!.getThemeColor()[200]!,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    weatherData!.cityTitle.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated at: ${weatherData!.applicableDate.hour.toString()}:${weatherData!.applicableDate.minute.toString()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        weatherData!.theTemp.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max Temp: ' + (weatherData!.maxTemp).toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Min Temp: ' + (weatherData!.minTemp).toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  Text(
                    weatherData!.weatherStateName.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 4),
                ],
              ),
            ),
    );
  }
}
