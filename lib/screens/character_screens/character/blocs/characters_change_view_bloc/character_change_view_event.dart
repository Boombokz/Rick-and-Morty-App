part of 'character_change_view_bloc.dart';

@immutable
abstract class CharacterChangeViewEvent {}

class CharacterChangeViewStartEvent extends CharacterChangeViewEvent {
  final bool isChanged;

  CharacterChangeViewStartEvent({required this.isChanged});
}
