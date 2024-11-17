import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:provider/provider.dart';
import 'package:weather_demo/Pages/HomePage.dart';
import 'package:weather_demo/Pages/pollution_info.dart';
import 'package:weather_demo/Services/weather_service.dart';

import 'Pages/Personalization/Database/user_info.dart';
import 'Pages/Personalization/personalization.dart';

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

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // Create notification channel for Android
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'weather_service', // id
    'Weather Service', // name
    description: 'This channel is used for weather service notifications.', // description
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: channel.id,
      initialNotificationTitle: 'Weather Service',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: null,
    ),
  );
}
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    // Create notification channel
    const String channelId = 'weather_service';
    const String channelName = 'Weather Service';
    const String channelDescription = 'Channel for Weather Service Notifications';

    final AndroidNotificationChannel channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDescription,
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    service.setAsForegroundService();

    // Periodic task execution
    Timer.periodic(Duration(minutes: 10), (timer) async {
        if (await service.isForegroundService()) {
          await _updateWeatherAndNotify();
        }

    });
    // Initial update
    await _updateWeatherAndNotify();
  }
}

Future<void> _updateWeatherAndNotify() async {
  try {
    await Future.delayed(Duration(seconds: 10));
    final weatherService = WeatherService();
    final weather = await weatherService.getCurrentWeather();
    final airQuality = await weatherService.getAirQuality();

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'weather_service',
      'Weather Service',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      styleInformation: BigTextStyleInformation(
        'Air Quality: ${_getAirQualityText(airQuality.aqi)}${_getAirQualityIcon(airQuality.aqi)}, ${_getAirQualityDescription(airQuality.aqi)}\nWeather: ${weather.mainCondition}, Temp: ${weather.temperature}°C\n',
      ),
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Allergy and Asthma Alert',
      'Air Quality: ${_getAirQualityText(airQuality.aqi)}, ${_getAirQualityIcon(airQuality.aqi)} ${_getAirQualityDescription(airQuality.aqi)}\nWeather: ${weather.mainCondition}, Temp: ${weather.temperature}°C\n',
      platformChannelSpecifics,
    );
  } catch (e) {
  }
}

String _getAirQualityIcon(int aqi) {
  if (aqi >= 0 && aqi <= 1) {
    return '🟢'; // Green circle
  } else if (aqi >= 2 && aqi <= 3) {
    return '🟡'; // Yellow circle
  } else if (aqi >= 3 && aqi <= 4) {
    return '🟠'; // Orange circle
  } else if (aqi >= 4 && aqi <= 5) {
    return '🔴'; // Red circle
  } else if (aqi >= 5 && aqi <= 6) {
    return '🟣'; // Purple circle
  } else {
    return '🟤'; // Brown circle
  }
}

Future<void> _requestPermissions() async {
  await [
    Permission.location,
    Permission.locationAlways,
    Permission.locationWhenInUse,
    Permission.notification,
    Permission.ignoreBatteryOptimizations,
  ].request();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userInfo = UserInfo();
  await userInfo.initialize();
  _requestPermissions();
  await initializeService();
  runApp(ChangeNotifierProvider(create: (BuildContext context)  => UserInfo(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        '/home': (context) => Homepage(),
        'pollution_info': (context) => PollutionInfo(),
        'personalization': (context) => Personalization(),
      },
    );
  }
}
