part of 'character_change_view_bloc.dart';

@immutable
abstract class CharacterChangeViewState {}

class CharacterChangeViewInitialState extends CharacterChangeViewState{}

class CharacterChangedViewState extends CharacterChangeViewState {
  final bool isChanged;

  CharacterChangedViewState({required this.isChanged});
}

