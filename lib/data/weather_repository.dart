import 'package:bolum_33_weather_app/data/weather_api_client.dart';
import 'package:bolum_33_weather_app/locater.dart';
import 'package:bolum_33_weather_app/model/weather.dart';

class WeatherRepository {
  final WeatherApiClient _weatherApiClient = getIt<WeatherApiClient>();
  Future<Weather>? getWeatherFromApi(String cityName) async {
    int cityId = await _weatherApiClient.getCityId(cityName);
    Weather weather = await _weatherApiClient.getWeather(cityId);
    return weather;
  }
}
