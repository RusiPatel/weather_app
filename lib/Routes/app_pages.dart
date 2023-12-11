import 'package:get/get.dart';
import 'package:weather_app/Screen/location_screen.dart';
import 'package:weather_app/Screen/splash_screen.dart';
import 'package:weather_app/Screen/weather_screen.dart';

import 'routes.dart';

class AppPages {
  static const initialRoutes = Routes.splashScreen;

  static final routes = [
    GetPage(name: Routes.splashScreen, page: ()=> SplashScreen(), ),
    GetPage(name: Routes.locationScreen, page: ()=> LocationScreen(), ),
    GetPage(name: Routes.weatherScreen, page: ()=> WeatherScreen(), ),
  ];
}