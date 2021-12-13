import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(CreateThemeData(
            themeData: ThemeData(primarySwatch: Colors.blue),
            color: Colors.amber)) {
    on<ThemeEvent>((event, emit) {
      CreateThemeData? _createThemeData;
      if (event is ChangeTheme) {
        switch (event.themeState) {
          case "sn": //snow
          case "sl": //sleet
          case "h": //hail
          case "t": //thunderstorm
          case "hc": //heavy cloud
            _createThemeData = CreateThemeData(
                themeData: ThemeData(primarySwatch: Colors.blueGrey),
                color: Colors.grey);
            break;

          case "hr": //heavy rain
          case "lr": //light rain
          case "s": // showers
            _createThemeData = CreateThemeData(
                themeData: ThemeData(primarySwatch: Colors.indigo),
                color: Colors.indigo);
            break;

          case "lc": //alight cloud
          case "c": //clear
            _createThemeData = CreateThemeData(
                themeData: ThemeData(primarySwatch: Colors.orange),
                color: Colors.yellow);
            break;
        }
        emit(_createThemeData!);
      }
    });
  }
}
