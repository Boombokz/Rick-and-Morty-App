part of 'character_search_bloc.dart';

@immutable
abstract class CharacterSearchEvent {}

class CharacterSearchInitialEvent extends CharacterSearchEvent {}

class CharacterSearchStartEvent extends CharacterSearchEvent {
  final String text;
  CharacterSearchStartEvent({required this.text});
}
