part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState{
  final Character character;

  CharacterLoadedState({required this.character});
}

class CharacterLoadErrorState extends CharacterState {

}