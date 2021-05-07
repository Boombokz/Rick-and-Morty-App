part of 'character_search_bloc.dart';

@immutable
abstract class CharacterSearchState {}

class CharacterSearchInitial extends CharacterSearchState {}

class CharacterSearchLoadingState extends CharacterSearchState {}

class CharacterSearchedState extends CharacterSearchState {
  final List<Character> searchedCharacters;

  CharacterSearchedState({required this.searchedCharacters});
}

class CharacterSearchErrorState extends CharacterSearchState {}


