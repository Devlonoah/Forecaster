import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:stream_tutorial_dec_2020/repository/repository.dart';

class WeatherBloc {
  String appBar = 'Prewer';
  final _repository = WeatherRepository();

  final _weatherFetcher = PublishSubject<WeatherResponse>();
  Stream<WeatherResponse> get weatherData => _weatherFetcher.stream;

//stream for input @ search
//TODO: Future(Implementation) Add textField to implement this in the UI
  // final _citySearch = PublishSubject<String>();
  // Stream<String> get citySearch =>
  //     _citySearch.stream.transform(validateCitySearch);
  // Function(String) get changeCityName => _citySearch.sink.add;

  // final validateCitySearch = StreamTransformer<String, String>.fromHandlers(
  //   handleData: (citySearch, sink) {
  //     if (citySearch.length < 4) {
  //       sink.addError('City name must be at least 4');
  //     }
  //     sink.add(citySearch);
  //   },
  // );

  Future fetchWeatherData() async {
    WeatherResponse weatherResponse = await _repository.fetchWeatherData();
    print(weatherResponse);
    _weatherFetcher.sink.add(weatherResponse);
  }

  void dispose() {
    _weatherFetcher.close();
  }
}
