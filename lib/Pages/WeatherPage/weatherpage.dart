import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_demo/Services/weather_service.dart';
import '../../models/weather_model.dart';
import 'package:intl/intl.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _weatherService = WeatherService();
  Weather? _weather;
  List<Forecast>? _forecast;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _fetchForecast();
  }




  @override
  void dispose() {
    super.dispose();
  }

  void _fetchWeather() async {
    final weather = await _weatherService.getCurrentWeather();
    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      _weather = weather;
    });
  }

  void _fetchForecast() async {
    final forecast = await _weatherService.getHourlyForecast();
    final now = DateTime.now();
    final filteredForecast = forecast.where((f) {
      final forecastTime = DateTime.parse(f.dateTime).toLocal();
      return forecastTime.isAfter(now);
    }).toList();

    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      _forecast = filteredForecast;
    });
  }

  String animations(String? mainCondition) {
    if (mainCondition == 'Clear') {
      return 'lib/assets/sunny.json';
    } else if (mainCondition == 'Clouds') {
      return 'lib/assets/cloudy.json';
    } else if (mainCondition == 'Rain') {
      return 'lib/assets/rainy.json';
    } else if (mainCondition == 'Thunderstorm') {
      return 'lib/assets/thunderstorm.json';
    } else if (mainCondition == 'Sunny') {
      return 'lib/assets/sunny.json';
    } else if (mainCondition == 'Haze') {
      return 'lib/assets/cloudy.json';
    } else {
      return 'lib/assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Weather',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
              if (_weather != null)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Text(
                                _weather!.cityName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Temp',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Text(
                                '${_weather!.temperature}°C',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weather',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Text(
                                _weather!.mainCondition,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Lottie.asset(
                            animations(_weather!.mainCondition),
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Forecast',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
              if (_forecast != null)
                ListView.builder(
                  itemBuilder: (context, index) {
                    DateTime? forecastTime;
                    forecastTime = DateTime.parse(_forecast![index].dateTime).toLocal(); // Ensure local time
                    String formattedTime = DateFormat('hh:mm a').format(forecastTime);
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[800]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    formattedTime,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Temp',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    '${_forecast![index].temperature}°C',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Weather',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    _forecast![index].mainCondition,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Lottie.asset(
                                animations(_forecast![index].mainCondition),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              if (_weather == null)
                 Column(
                  children: [
                    Lottie.asset(
                      'lib/assets/loading.json',
                      height: 200,
                      width: 200,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -50),
                      child: Text(
                        'Fetching weather & forecast...',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}