part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  @override
  List<Object> get props => [themeState];
  final String themeState;
  const ChangeTheme({required this.themeState});
}
