import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart' as net;
import 'package:meta/meta.dart';

import '../../model/weather_response.dart';
import '../../repository/repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(WeatherRepository repository) : super(WeatherInitial()) {
    _weatherRepository = repository ?? WeatherRepository();
  }

  WeatherRepository _weatherRepository;

  void fetchWeatherDataForCurrentLocation() async {
    emit(WeatherLoadInProgress());

    // _connectionStateBloc.fecthConnectionState();

    try {
      final _result = await _weatherRepository.fetchWeatherData();

      emit(WeatherLoadSuccessful(_result));
    } catch (e) {
      emit(WeatherLoadFailure('Check your connection'));
    }
  }
}
