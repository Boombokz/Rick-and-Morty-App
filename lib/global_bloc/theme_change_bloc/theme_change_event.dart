part of 'theme_change_bloc.dart';

@immutable
abstract class ThemeChangeEvent {}

class ThemeChangeStartEvent extends ThemeChangeEvent {
  final ThemeMode themeMode;
  final Color navBarColor;

  ThemeChangeStartEvent({required this.themeMode, required this.navBarColor});
}