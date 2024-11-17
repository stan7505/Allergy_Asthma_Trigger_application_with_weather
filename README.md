# ALLERGY AND ASTHMA TRIGGER APPLICATION WITH WEATHER

A new Flutter project that provides weather updates and air quality information. This project demonstrates the use of various Flutter plugins and APIs to create a comprehensive weather application.

## Features

### Weather and Air Quality Information
- The application fetches current weather data, hourly forecasts, and air pollution levels using the OpenWeatherMap API.
- The weather data is displayed to the user in a user-friendly interface.

### Geolocation
- The application uses the geolocator package to fetch the user's current location.
- The location data is used to provide weather updates specific to the user's location.

### Local Notifications
- The application uses the flutter_local_notifications package to send local notifications to the user.
- Notifications are used to alert the user about severe weather conditions and air quality alerts.

### Background Service
- The application uses the flutter_background_service package to run background tasks.
- Background tasks include fetching weather updates periodically and sending notifications even when the app is not in the foreground.

### AI & ML
- The project does not currently implement AI or ML features. However, it can be extended to include predictive models for weather forecasting or air quality predictions using machine learning algorithms.

## Project Structure
- `lib`: Contains the main application code.
  - `main.dart`: Entry point of the application.
  - `weather_service.dart`: Contains the logic for fetching weather data from the OpenWeatherMap API.
  - `Pages/`: Contains the UI pages of the application.
- `assets`: Contains the assets used in the application.
- `android`, `ios`, `linux`, `macos`, `windows`: Platform-specific code for the application.
- `pubspec.yaml`: Contains the dependencies and configuration for the Flutter project.

## Dependencies
- `geolocator`: For fetching the user's current location.
- `flutter_local_notifications`: For sending local notifications.
- `flutter_background_service`: For running background tasks.
- `http`: For making HTTP requests to the OpenWeatherMap API.

## Getting Started
To get started with this project, clone the repository and run the following commands:

For more information on Flutter development, view the [online documentation](https://docs.flutter.dev/).

## API Usage
The application uses the OpenWeatherMap API to fetch weather data. The API endpoints used are:
- `https://pro.openweathermap.org/data/2.5/weather`
- `https://pro.openweathermap.org/data/2.5/forecast/hourly`
- `https://pro.openweathermap.org/data/2.5/air_pollution`

## Geolocation Sensors
The application uses the geolocator package to access the device's geolocation sensors and fetch the current latitude and longitude.

## Local Notifications
The application uses the flutter_local_notifications package to create and manage local notifications. Notifications are used to alert the user about weather updates and severe conditions.

## Background Manager
The application uses the flutter_background_service package to run tasks in the background. This allows the application to fetch weather updates periodically and send notifications even when the app is not in the foreground.

## Conclusion
This project serves as a starting point for building a comprehensive weather application using Flutter. It demonstrates the integration of various Flutter plugins and APIs to provide a seamless user experience.

<img src="https://github.com/user-attachments/assets/c7cb6ee3-3c5e-4b63-8b2e-23126bff1f3b" alt="weather" width="300" height="300">
<img src="https://github.com/user-attachments/assets/9eb31015-acc8-4bc3-a0b0-ae95401c30f4" alt="Screenshot_2024-11-17-14-35-27-81_0e129472393371b4b5242915a337985a" width="300" height="300">
<img src="https://github.com/user-attachments/assets/5f45d911-15c4-4e3a-8b1f-a9b23b57307b" alt="Screenshot_2024-11-17-14-36-44-96_0e129472393371b4b5242915a337985a" width="300" height="300">
<img src="https://github.com/user-attachments/assets/3a12361b-1735-466d-ac94-b8e4edd61457" alt="Screenshot_2024-11-17-14-36-06-01_0e129472393371b4b5242915a337985a" width="300" height="300">
