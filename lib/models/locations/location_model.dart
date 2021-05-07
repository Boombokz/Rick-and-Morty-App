import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class Location {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;

  Location({required this.id, required this.name, required this.type, required this.dimension, required this.residents});

  factory Location.fromJson(Map<String, dynamic> data) =>
      _$LocationFromJson(data);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

}
