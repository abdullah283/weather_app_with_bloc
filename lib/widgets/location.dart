import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, state) {
          final String _pickedCity = (state as WeatherLoaded).weather.title;
          return Text(
            _pickedCity,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          );
        });
  }
}
