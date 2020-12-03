import 'package:rxdart/rxdart.dart';
import 'package:stream_tutorial_dec_2020/model/weather.dart';

import 'package:stream_tutorial_dec_2020/repository/repository.dart';

class WeatherBloc {
  final _repository = WeatherRepository();

  final _weatherFetcher = PublishSubject<WeatherItemModel>();
  Stream<WeatherItemModel> get weatherData => _weatherFetcher.stream;

  fetchWeatherData() async {
    WeatherItemModel weatherItemModel = await _repository.fetchWeatherData();
    _weatherFetcher.sink.add(weatherItemModel);
  }

  void dispose() {
    _weatherFetcher.close();
  }
}
