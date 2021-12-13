import 'package:bolum_33_weather_app/data/weather_api_client.dart';
import 'package:bolum_33_weather_app/data/weather_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton(() => WeatherRepository());
  getIt.registerLazySingleton(() => WeatherApiClient());
}
