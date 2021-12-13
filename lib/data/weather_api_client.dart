import 'package:bolum_33_weather_app/model/weather.dart';
import 'package:dio/dio.dart';

class WeatherApiClient {
  // firsly was getted city id from source Api //
  Future<int> getCityId(String cityName) async {
    var dio = Dio();
    final response = await dio.get(
        'https://www.metaweather.com/api/location/search/?query=$cityName');
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch city data");
    }
    var cityId = response.data as List;
    return cityId[0]['woeid'];
  }

  // secondly was getted city weather from source Api //
  Future<Weather> getWeather(int cityId) async {
    var dio = Dio();
    Weather weather;
    final response =
        await dio.get('https://www.metaweather.com/api/location/$cityId/');
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch weather data");
    }
    weather = Weather.fromMap(response.data);
    return weather;
  }
}
