class Weather {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String mainCondition;
  final String description;
  final String cityName;

  Weather({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.mainCondition,
    required this.description,
    required this.cityName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp']?.toDouble() ?? 0.0,
      feelsLike: json['main']['feels_like']?.toDouble() ?? 0.0,
      humidity: json['main']['humidity'] ?? 0,
      mainCondition: json['weather'][0]['main'] ?? 'Unknown',
      description: json['weather'][0]['description'] ?? 'Unknown',
      cityName: json['name'] ?? 'Unknown',
    );
  }
}
class Forecast {
  final double temperature;
  final int humidity;
  final String mainCondition;
  final String description;
  final String dateTime;

  Forecast({
    required this.temperature,
    required this.humidity,
    required this.mainCondition,
    required this.description,
    required this.dateTime,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      temperature: json['main']['temp']?.toDouble() ?? 0.0,
      humidity: json['main']['humidity'] ?? 0,
      mainCondition: json['weather'][0]['main'] ?? 'Unknown',
      description: json['weather'][0]['description'] ?? 'Unknown',
      dateTime: json['dt_txt'] ?? '',
    );
  }
}
class AirQuality {
  final int aqi;
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

  AirQuality({
    required this.aqi,
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.nh3,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      aqi: json['main']['aqi'] ?? 0,
      co: json['components']['co']?.toDouble() ?? 0.0,
      no: json['components']['no']?.toDouble() ?? 0.0,
      no2: json['components']['no2']?.toDouble() ?? 0.0,
      o3: json['components']['o3']?.toDouble() ?? 0.0,
      so2: json['components']['so2']?.toDouble() ?? 0.0,
      pm2_5: json['components']['pm2_5']?.toDouble() ?? 0.0,
      pm10: json['components']['pm10']?.toDouble() ?? 0.0,
      nh3: json['components']['nh3']?.toDouble() ?? 0.0,
    );
  }
}
