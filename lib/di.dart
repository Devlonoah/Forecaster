import 'package:get_it/get_it.dart';

import 'blocs/weathercubit/weather_cubit.dart';
import 'repository/repository.dart';

GetIt sl = GetIt.I;

void initDi() {
  sl.registerLazySingleton(() => WeatherRepository());
  sl.registerFactory(() => WeatherCubit(sl()));
}
