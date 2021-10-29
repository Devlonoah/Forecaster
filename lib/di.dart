import 'package:get_it/get_it.dart';
import 'package:stream_tutorial_dec_2020/blocs/weathercubit/weather_cubit.dart';
import 'package:stream_tutorial_dec_2020/repository/repository.dart';

GetIt sl = GetIt.I;

void initDi() {
  sl.registerLazySingleton(() => WeatherRepository());
  sl.registerFactory(() => WeatherCubit(sl()));
}
