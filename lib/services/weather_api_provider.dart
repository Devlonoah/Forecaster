import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/weather_response.dart';

class WeatherApiProvider {
  Future<WeatherResponse> fetchWeatherData({double lat, double long}) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=ef7492ff156e3449f868bf20f5bf097a";

    try {
      http.Response response = await http.get(api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        WeatherResponse exploreData = WeatherResponse.fromJson(data);
        print('decoded: $exploreData');

        return exploreData;
      }
    } catch (e) {
      print('error code message : ${e.toString()}');
    }
  }
}
