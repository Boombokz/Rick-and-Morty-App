import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  Origin origin;
  CharacterLocation location;
  String image;
  List<String> episode;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  String name;
  String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> data) => _$OriginFromJson(data);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class CharacterLocation {
  String name;
  String url;

  CharacterLocation({required this.name, required this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> data) =>
      _$CharacterLocationFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);
}

