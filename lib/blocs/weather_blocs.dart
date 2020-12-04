import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stream_tutorial_dec_2020/model/weather.dart';

import 'package:stream_tutorial_dec_2020/repository/repository.dart';

class WeatherBloc {
  final _repository = WeatherRepository();

  final _weatherFetcher = PublishSubject<WeatherItemModel>();
  Stream<WeatherItemModel> get weatherData => _weatherFetcher.stream;

//stream for input @ search
//TODO: Add textField to implement this in the UI
  final _citySearch = PublishSubject<String>();
  Stream<String> get citySearch =>
      _citySearch.stream.transform(validateCitySearch);
  Function(String) get changeCityName => _citySearch.sink.add;

  final validateCitySearch = StreamTransformer<String, String>.fromHandlers(
    handleData: (citySearch, sink) {
      if (citySearch.length < 4) {
        sink.addError('City name must be at least 4');
      }
      sink.add(citySearch);
    },
  );

  fetchWeatherData() async {
    WeatherItemModel weatherItemModel = await _repository.fetchWeatherData();

    print(weatherItemModel.cityName);
    _weatherFetcher.sink.add(weatherItemModel);
  }

  void dispose() {
    _weatherFetcher.close();
  }
}
