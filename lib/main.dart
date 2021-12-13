import 'package:bolum_33_weather_app/blocs/bloc/weather_bloc.dart';
import 'package:bolum_33_weather_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:bolum_33_weather_app/locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/weather_app.dart';

void main() {
  setupGetIt();
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: (themeState as CreateThemeData).themeData,
          home: BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(), child: WeatherApp()),
        );
      },
    );
  }
}
