import 'package:geolocator/geolocator.dart';
import 'package:stream_tutorial_dec_2020/model/weatherItemModel.dart';
import 'package:stream_tutorial_dec_2020/services/location_provider.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

class WeatherRepository {
  final _locationProvider = LocationProvider();
  final weatherApiProvider = WeatherApiProvider();
  Position position;
  Future<WeatherItemModel> fetchWeatherData() async {
    // var positionData =

    Position position = await _locationProvider.fetchLocation();

    WeatherItemModel data = await _weatherApiCall(position);

    return data;
  }

  Future<WeatherItemModel> _weatherApiCall(Position position) async {
    WeatherItemModel returnedData = await weatherApiProvider.fetchWeatherData(
        lat: position.latitude, long: position.longitude);
    // print("returned data : ${returnedData.coord}");
    return returnedData;
  }
}
