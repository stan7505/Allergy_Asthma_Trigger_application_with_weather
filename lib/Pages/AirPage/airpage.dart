import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../Bar_graph/bar_graph.dart';
import '../../Services/weather_service.dart';
import '../../models/weather_model.dart';

class Airpage extends StatefulWidget {
  const Airpage({super.key});

  @override
  State<Airpage> createState() => _AirpageState();
}

class _AirpageState extends State<Airpage> {
  final _weatherService = WeatherService();
  AirQuality? _airQuality;
  Interpreter? _interpreter;
  int _aqi = 0;
  int actualAQI = 0;
  double predictedAQI = 0.0;
  List<double> Aircomponents = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  bool _isLoading = true;

  final List<String> _modelNames = [
    "AI model retrieving API data",
    "AI model processing data",
    "AI model predicting using Random Forest",
    "AI model predicting using Logistic Regression",
    "AI model predicting using neural network",
  ];
  int _currentModelIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _fetchAirQuality();
    _loadModel();
    _startModelNameTimer();
  }

  void _startModelNameTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentModelIndex = (_currentModelIndex + 1) % _modelNames.length;
      });
    });
  }

  @override
  void dispose() {
    _interpreter?.close(); // Ensure interpreter is closed
    _timer.cancel(); // Cancel the timer
    super.dispose();
  }

  void _fetchAirQuality() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    await Future.delayed(Duration(seconds: 10)); // Add a delay of 5 seconds

    final airQuality = await _weatherService.getAirQuality();
    if (mounted) {
      setState(() {
        _airQuality = airQuality;
        _aqi = airQuality.aqi;
        actualAQI = airQuality.aqi;
        Aircomponents = [
          airQuality.co,
          airQuality.no,
          airQuality.no2,
          airQuality.o3,
          airQuality.so2,
          airQuality.pm2_5,
          airQuality.pm10,
          airQuality.nh3
        ];
        predictedAQI = predictAQI(airQuality);
        _isLoading = false; // Set loading state to false
      });
    }
  }

  Future<void> _loadModel() async {
      _interpreter = await Interpreter.fromAsset('lib/assets/neural_network_model.tflite');

  }

  double predictAQI(AirQuality airQuality) {
    final input = <List<double>>[
      <double>[
        airQuality.co,
        airQuality.no,
        airQuality.no2,
        airQuality.o3,
        airQuality.so2,
        airQuality.pm2_5,
        airQuality.pm10,
        airQuality.nh3,
      ]
    ];


    // Initialize the output buffer with the correct type
    var output = List<List<double>>.filled(1, List<double>.filled(6, 0.0));



      _interpreter?.run(input, output);



    // Extract probabilities as List<double>
    List<double> probabilities = output[0];

    // Find the index of the maximum probability
    int predictedClass = probabilities.indexOf(probabilities.reduce((double a, double b) => a > b ? a : b));

    return predictedClass.toDouble();
  }

  Future<double> getPredictedAQI() async {
    final airQuality = await _weatherService.getAirQuality();
    return predictAQI(airQuality);
  }

  String _getAirQualityText(int aqi) {
    if (aqi >= 0 && aqi <= 1) {
      return 'Good';
    } else if (aqi >= 2 && aqi <= 3) {
      return 'Moderate';
    } else if (aqi >= 3 && aqi <= 4) {
      return 'Unhealthy for Sensitive Groups';
    } else if (aqi >= 4 && aqi <= 5) {
      return 'Unhealthy';
    } else if (aqi >= 5 && aqi <= 6) {
      return 'Very Unhealthy';
    } else {
      return 'Hazardous';
    }
  }

  String _getAirQualityDescription(int aqi) {
    if (aqi >= 0 && aqi <= 1) {
      return 'Air quality is considered satisfactory, and air pollution poses little or no risk. No asthma or allergy alerts.';
    } else if (aqi >= 1 && aqi <= 2) {
      return 'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution. Mild asthma and allergy alerts.';
    } else if (aqi >= 2 && aqi <= 3) {
      return 'Members of sensitive groups may experience health effects. The general public is not likely to be affected. Asthma and allergy alerts for sensitive individuals.';
    } else if (aqi >= 3 && aqi <= 4) {
      return 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects. High asthma and allergy alerts.';
    } else if (aqi >= 4 && aqi <= 5) {
      return 'Health alert: everyone may experience more serious health effects. Severe asthma and allergy alerts.';
    } else {
      return 'Health warnings of emergency conditions. The entire population is more likely to be affected. Extreme asthma and allergy alerts.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: _isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, -20), // Adjust the offset as needed
              child: Lottie.asset('lib/assets/ai_model.json'),
            ),
            Transform.translate(
              offset: Offset(0, -150), // Adjust the offset as needed
              child: Lottie.asset('lib/assets/loading.json'),
            ),
            Transform.translate(
              offset: Offset(0, -200),
              child: Text(
                _modelNames[_currentModelIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true, // Allows text to wrap to the next line
              ),
            ),
          ],
        )
        :SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Air Components',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: MyBarGraph(Aircomponents: Aircomponents),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: Text(
                                'Current Air Quality: ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.circle,
                              color: actualAQI >= 0 && _aqi <= 1
                                  ? Colors.green
                                  : actualAQI >= 2 && _aqi <= 3
                                  ? Colors.yellow
                                  : actualAQI >= 3 && _aqi <= 4
                                  ? Colors.orange
                                  : actualAQI >= 4 && _aqi <= 5
                                  ? Colors.red
                                  : actualAQI >= 5 && _aqi <= 6
                                  ? Colors.purple
                                  : Colors.brown,
                              size: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _getAirQualityText(actualAQI),
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 20),
                        child: Text(
                          _getAirQualityDescription(actualAQI),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 50),
                            Expanded(
                              child: Text(
                                'Predicted Air Quality using AI & ML for tomorrow: ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.circle,
                              color: predictedAQI >= 0 && predictedAQI <= 1
                                  ? Colors.green
                                  : predictedAQI >= 2 && predictedAQI <= 3
                                  ? Colors.yellow
                                  : predictedAQI >= 3 && predictedAQI <= 4
                                  ? Colors.orange
                                  : predictedAQI >= 4 && predictedAQI <= 5
                                  ? Colors.red
                                  : predictedAQI >= 5 && predictedAQI <= 6
                                  ? Colors.purple
                                  : Colors.brown,
                              size: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _getAirQualityText(predictedAQI.toInt()),
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 20),
                        child: Text(
                          _getAirQualityDescription(predictedAQI.toInt()),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}