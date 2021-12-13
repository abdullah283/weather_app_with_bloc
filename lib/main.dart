import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:bolum_33_weather_app/blocs/teme_bloc/tema_bloc.dart';
import 'package:bolum_33_weather_app/locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/weather_app.dart';

void main() {
  setupGetIt();
  runApp(BlocProvider<TemaBloc>(
    create: (context) => TemaBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaBloc, TemaState>(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, temaState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: (temaState as CreateThemeData).themeData,
          home: BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(), child: WeatherApp()),
        );
      },
    );
  }
}
