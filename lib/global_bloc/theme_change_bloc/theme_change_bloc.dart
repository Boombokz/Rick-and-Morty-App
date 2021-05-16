import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/theme/color_theme.dart';

part 'theme_change_event.dart';
part 'theme_change_state.dart';

class ThemeChangeBloc extends Bloc<ThemeChangeEvent, ThemeChangeState> {
  ThemeChangeBloc() : super(ThemeChangeState(themeMode: ThemeMode.dark, navBarColor: ColorPalette.greyBlueColor));

  @override
  Stream<ThemeChangeState> mapEventToState(
    ThemeChangeEvent event,
  ) async* {
    if (event is ThemeChangeStartEvent) {
      yield ThemeChangeState(themeMode: event.themeMode, navBarColor: event.navBarColor);
    }
  }
}
