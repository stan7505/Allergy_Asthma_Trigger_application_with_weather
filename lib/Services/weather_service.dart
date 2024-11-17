import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String BASE_URL = 'https://pro.openweathermap.org/data/2.5/weather';
  static const String BASE_URL2 = 'https://pro.openweathermap.org/data/2.5/forecast/hourly';
  static const String BASE_URL3 = 'https://pro.openweathermap.org/data/2.5/air_pollution';
  final String apikey = 'YOUR_API_KEY';
  late double latitude;
  late double longitude;

  /// Initializes location by fetching current latitude and longitude
  Future<void> initializeLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latitude = position.latitude;
    longitude = position.longitude;
  }

  /// Fetches the current weather data using internal latitude and longitude
  Future<Weather> getCurrentWeather() async {
    await initializeLocation(); // Ensure location is initialized
    final url = Uri.parse(
        '$BASE_URL?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      // Handle response correctly based on the received structure
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather data. Status: ${response.statusCode}');
    }
  }

  /// Fetches the hourly forecast using internal latitude and longitude
  Future<List<Forecast>> getHourlyForecast() async {
    await initializeLocation(); // Ensure location is initialized
    final url = Uri.parse(
        '$BASE_URL2?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['list'] != null) {
        return (json['list'] as List)
            .map((item) => Forecast.fromJson(item))
            .toList();
      } else {
        throw Exception('Forecast data is unavailable.');
      }
    } else {
      throw Exception('Failed to load forecast data. Status: ${response.statusCode}');
    }
  }

  /// Gets the user's current city based on the initialized location
  Future<String> getCurrentCity() async {
    await initializeLocation(); // Ensure location is initialized
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

    return placemarks.isNotEmpty ? placemarks[0].locality ?? 'Unknown' : 'Unknown';
  }

  Future<AirQuality> getAirQuality() async {
    await initializeLocation();
    final url = Uri.parse(
        '$BASE_URL3?lat=$latitude&lon=$longitude&appid=$apikey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['list'] != null && json['list'].isNotEmpty) {
        return AirQuality.fromJson(json['list'][0]);
      } else {
        throw Exception('Air quality data is unavailable.');
      }
    } else {
      throw Exception('Failed to load air quality data. Status: ${response.statusCode}');
    }
  }
}

