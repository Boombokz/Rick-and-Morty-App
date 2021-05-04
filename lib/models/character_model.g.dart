// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    species: json['species'] as String,
    gender: json['gender'] as String,
    origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'origin': instance.origin.toJson(),
      'location': instance.location.toJson(),
      'image': instance.image,
    };

Origin _$OriginFromJson(Map<String, dynamic> json) {
  return Origin(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      'name': instance.name,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
    };
