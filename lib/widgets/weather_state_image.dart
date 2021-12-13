import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherStateImageWidget extends StatelessWidget {
  const WeatherStateImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        final String imageIcon = (state as WeatherLoaded)
            .weather
            .consolidatedWeather[0]
            .weatherStateAbbr;
        final String currentTemperature =
            state.weather.consolidatedWeather[0].theTemp.floor().toString();
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              currentTemperature + ' °C',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            Image.network(
              'https://www.metaweather.com/static/img/weather/png/' +
                  imageIcon +
                  '.png',
              width: 150,
              height: 150,
            ),
          ],
        );
      },
    );
  }
}
