
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class Episode {
  int id;
  String name;
  String air_date;
  String episode;
  List<String> characters;

  Episode({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
  });

  factory Episode.fromJson(Map<String, dynamic> data) =>
      _$EpisodeFromJson(data);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
