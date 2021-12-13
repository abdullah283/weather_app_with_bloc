import 'package:bloc/bloc.dart';
import 'package:bolum_33_weather_app/data/weather_repository.dart';
import 'package:bolum_33_weather_app/locater.dart';
import 'package:bolum_33_weather_app/model/weather.dart';
import 'package:equatable/equatable.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository = getIt<WeatherRepository>();
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(WeatherLoading());
        try {
          Weather? fetchedWeather =
              await weatherRepository.getWeatherFromApi(event.cityName);
          emit(WeatherLoaded(weather: fetchedWeather!));
        } catch (e) {
          emit(WeatherLoadError());
        }
      }
      if (event is RefreshWeatherEvent) {
        try {
          Weather? fetchedWeather =
              await weatherRepository.getWeatherFromApi(event.cityName);
          emit(WeatherLoaded(weather: fetchedWeather!));
        } catch (e) {
          emit(state);
        }
      }
    });
  }
}
