import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_change_event.dart';
part 'theme_change_state.dart';

class ThemeChangeBloc extends Bloc<ThemeChangeEvent, ThemeChangeState> {
  ThemeChangeBloc() : super(ThemeChangeInitial());

  @override
  Stream<ThemeChangeState> mapEventToState(
    ThemeChangeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
