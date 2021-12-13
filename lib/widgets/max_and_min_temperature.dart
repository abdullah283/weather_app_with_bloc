import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxAndMinTemplateWidget extends StatelessWidget {
  const MaxAndMinTemplateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, state) {
          final double maxTemperature =
              (state as WeatherLoaded).weather.consolidatedWeather[0].maxTemp;
          final double minTemperature =
              (state).weather.consolidatedWeather[0].minTemp;
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'max temp:' + maxTemperature.toInt().toString() + ' °C',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'min temp:' + minTemperature.toInt().toString() + ' °C',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        });
  }
}
