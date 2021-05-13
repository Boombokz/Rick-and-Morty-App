import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'character_change_view_event.dart';

part 'character_change_view_state.dart';

class CharacterChangeViewBloc
    extends Bloc<CharacterChangeViewEvent, CharacterChangeViewState> {
  CharacterChangeViewBloc() : super(CharacterChangeViewInitialState());

  bool viewChanged = false;

  @override
  Stream<CharacterChangeViewState> mapEventToState(
    CharacterChangeViewEvent event,
  ) async* {
    if (event is CharacterChangeViewStartEvent) {
      viewChanged = event.isChanged;
      yield CharacterChangedViewState(isChanged: viewChanged);

    }
  }
}
