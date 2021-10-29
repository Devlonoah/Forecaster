part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccessful extends WeatherState {
  final WeatherResponse weatherData;

  WeatherLoadSuccessful(this.weatherData);
}

class WeatherLoadFailure extends WeatherState {
  final String message;

  WeatherLoadFailure(this.message);
}
