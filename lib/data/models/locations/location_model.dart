import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class Location {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;

  Location({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
  });

  factory Location.fromJson(Map<String, dynamic> data) =>
      _$LocationFromJson(data);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
