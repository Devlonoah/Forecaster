import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:stream_tutorial_dec_2020/repository/repository.dart';
import 'package:connectivity/connectivity.dart' as net;
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(WeatherRepository repository) : super(WeatherInitial()) {
    _weatherRepository = repository ?? WeatherRepository();
  }

  WeatherRepository _weatherRepository;

  void fetchWeatherDataForCurrentLocation() async {
    emit(WeatherLoadInProgress());

    // _connectionStateBloc.fecthConnectionState();

    final _connectionState = await net.Connectivity().checkConnectivity();

    if (_connectionState == net.ConnectivityResult.none) {
      emit(WeatherLoadFailure('No connection'));
    } else {
      try {
        final _result = await _weatherRepository.fetchWeatherData();

        emit(WeatherLoadSuccessful(_result));
      } catch (e) {
        emit(WeatherLoadFailure('Check your connection'));
      }
    }
  }
}
