import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  Origin? origin;
  CharacterLocation? location;
  String? image;
  List<String>? episode;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
  });

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> data) => _$OriginFromJson(data);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class CharacterLocation {
  String? name;
  String? url;

  CharacterLocation({this.name, this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> data) =>
      _$CharacterLocationFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);
}

