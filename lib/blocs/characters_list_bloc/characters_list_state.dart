part of 'characters_list_bloc.dart';

@immutable
abstract class CharactersListState {}

class CharactersListLoadingState extends CharactersListState {}

class CharactersListLoadedState extends CharactersListState {
  final List<Character> loadedCharacters;
  CharactersListLoadedState({required this.loadedCharacters});
}

class CharacterSelectedLoadedState extends CharactersListState{
  final Character character;

  CharacterSelectedLoadedState({required this.character});
}

class CharactersListLoadErrorState extends CharactersListState {

}
