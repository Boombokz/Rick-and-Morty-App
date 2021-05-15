part of 'theme_change_bloc.dart';

@immutable
abstract class ThemeChangeEvent {}

class ThemeChangeStartEvent extends ThemeChangeEvent {
  final ThemeMode themeMode;

  ThemeChangeStartEvent({required this.themeMode});
}