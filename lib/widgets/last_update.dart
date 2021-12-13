import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        final DateTime _upDateTime =
            (state as WeatherLoaded).weather.time.toLocal();
        return Text(
          'Last Update:' + TimeOfDay.fromDateTime(_upDateTime).format(context),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
