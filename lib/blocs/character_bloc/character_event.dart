part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class CharacterLoadEvent extends CharacterEvent {
  final int idCharacter;

  CharacterLoadEvent({required this.idCharacter});
}
