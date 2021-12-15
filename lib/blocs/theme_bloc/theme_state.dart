part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class CreateThemeData extends ThemeState {
  @override
  List<Object> get props => [themeData, color, abr];
  final ThemeData themeData;
  final MaterialColor color;
  final String abr;
  const CreateThemeData(
      {required this.themeData, required this.color, required this.abr});
}
