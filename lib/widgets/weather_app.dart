// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:async';
import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:bolum_33_weather_app/blocs/teme_bloc/tema_bloc.dart';
import 'package:bolum_33_weather_app/widgets/gradient_backgroundcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'max_and_min_temperature.dart';
import 'pick_city.dart';
import 'weather_state_image.dart';
import 'last_update.dart';
import 'location.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String? pickedCity = 'Ankara';
  Completer<void> _completer = Completer<void>();
  @override
  Widget build(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () async {
                  pickedCity = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PickCity()));
                  if (pickedCity != null) {
                    context
                        .read<WeatherBloc>()
                        .add(FetchWeatherEvent(cityName: pickedCity!));
                  }
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _weatherBloc,
            builder: (context, state) {
              if (state is WeatherInitial) {
                return const Center(
                  child: Text(
                    'please enter city',
                    style: TextStyle(fontSize: 35),
                  ),
                );
              }
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is WeatherLoaded) {
                pickedCity = state.weather.title;
                context.read<TemaBloc>().add(ChangeThema(
                    themeState:
                        state.weather.consolidatedWeather[0].weatherStateAbbr));
                _completer.complete();
                _completer = Completer();
                return RefreshIndicator(
                  onRefresh: () {
                    context
                        .read<WeatherBloc>()
                        .add(RefreshWeatherEvent(cityName: pickedCity!));
                    return _completer.future;
                  },
                  child: BlocBuilder(
                    bloc: BlocProvider.of<TemaBloc>(context),
                    builder: (context, temaState) {
                      return GradientBackgroundcolor(
                        color: (temaState as CreateThemeData).color,
                        child: Center(
                          child: ListView(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: LocationWidget()),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: LastUpdateWidget(),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: WeatherStateImageWidget(),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: MaxAndMinTemplateWidget(),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
            }));
  }
}
