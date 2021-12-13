part of 'weather_bloc.dart';

// events is created below abstract class //
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [WeatherEvent];
}

// was created event method //
class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  const FetchWeatherEvent({required this.cityName});
  @override
  List<Object> get props => [cityName];
}

// was created event method for refresh //
class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  const RefreshWeatherEvent({required this.cityName});
  @override
  List<Object> get props => [cityName];
}
