part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<Character> loadedCharacters;
  CharacterLoadedState({required this.loadedCharacters});
}

class CharacterLoadErrorState extends CharacterState {

}
