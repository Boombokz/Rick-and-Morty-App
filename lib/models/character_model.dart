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
  Location location;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  String name;

  Origin({required this.name});

  factory Origin.fromJson(Map<String, dynamic> data) => _$OriginFromJson(data);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> data) =>
      _$LocationFromJson(data);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
