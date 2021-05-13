part of 'theme_change_bloc.dart';

@immutable
abstract class ThemeChangeEvent {}

class ThemeChangeStartEvent extends ThemeChangeEvent {
  final ThemeData theme;

  ThemeChangeStartEvent({required this.theme});
}