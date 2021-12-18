part of 'characters_list_bloc.dart';

@immutable
abstract class CharactersListState {}

class CharactersListLoadingState extends CharactersListState {

}

class CharactersListLoadedState extends CharactersListState {
  final List<Character> loadedCharacters;

  CharactersListLoadedState({required this.loadedCharacters});
}

class CharactersListLoadErrorState extends CharactersListState {}
