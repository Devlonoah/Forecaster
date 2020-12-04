import 'package:geolocator/geolocator.dart';
import 'package:stream_tutorial_dec_2020/model/weather.dart';
import 'package:stream_tutorial_dec_2020/services/location_provider.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

class WeatherRepository {
  Position position;
  final _locationProvider = LocationProvider();
  final weatherApiProvider = WeatherApiProvider();

  Future<Position> getCurrentLocation() async {
    return position = await _locationProvider.fetchLocation();
  }

  Future<WeatherItemModel> fetchWeatherData() {
    getCurrentLocation();

    return weatherApiProvider.fetchWeatherData(
        lat: position.latitude, long: position.longitude);
  }
}
