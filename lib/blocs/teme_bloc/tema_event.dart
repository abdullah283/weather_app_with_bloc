part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();
}

class ChangeThema extends TemaEvent {
  @override
  List<Object> get props => [themeState];
  final String themeState;
  const ChangeThema({required this.themeState});
}
