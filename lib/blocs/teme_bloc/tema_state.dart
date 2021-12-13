part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState();
}

class CreateThemeData extends TemaState {
  @override
  List<Object> get props => [themeData, color];
  final ThemeData themeData;
  final MaterialColor color;
  const CreateThemeData({required this.themeData, required this.color});
}
