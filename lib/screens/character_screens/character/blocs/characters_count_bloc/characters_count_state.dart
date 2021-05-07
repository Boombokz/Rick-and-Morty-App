part of 'characters_count_bloc.dart';

@immutable
abstract class CharactersCountState {}

class CharactersCountLoadedState extends CharactersCountState {
  final int totalCount;

  CharactersCountLoadedState({required this.totalCount});
}

class CharactersCountLoadingState extends CharactersCountState {}


class CharacterCountErrorState extends CharactersCountState {}
