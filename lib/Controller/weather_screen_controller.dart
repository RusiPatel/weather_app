import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

import '../Utils/custom_snackbar.dart';

class WeatherScreenController extends GetxController {
  var weatherModel = WeatherModel().obs;

  Future<void> getWeatherOfCity(String city) async {
    try {
     var response = await http.get(Uri.parse(
          'http://api.weatherstack.com/current?access_key=b042a017b7fae2860b3607370b598ca8&query=$city'));
      if (response.statusCode == 200) {
        var map = json.decode(response.body);
        weatherModel.value = WeatherModel.fromJson(map);
        print(weatherModel.value.location!.name);
      }
    } catch (e) {
      rethrow;
    }
  }
}
