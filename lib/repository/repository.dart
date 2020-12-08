import 'package:geolocator/geolocator.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:stream_tutorial_dec_2020/services/location_provider.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

class WeatherRepository {
  final _locationProvider = LocationProvider();
  final weatherApiProvider = WeatherApiProvider();
  Position position;
  Future<WeatherResponse> fetchWeatherData() async {
    // var positionData =

    Position position = await _locationProvider.fetchLocation();

    WeatherResponse data = await _weatherApiCall(position);
    print('repo side:$data');
    return data;
  }

  Future<WeatherResponse> _weatherApiCall(Position position) async {
    WeatherResponse returnedData = await weatherApiProvider.fetchWeatherData(
        lat: position.latitude, long: position.longitude);

    return returnedData;
  }
}
