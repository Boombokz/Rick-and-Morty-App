
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class Episode {
  int? id;
  String? name;
  @JsonKey(name: 'air_date')String? airDate;
  String? episode;
  List<String>? characters;

  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
  });

  factory Episode.fromJson(Map<String, dynamic> data) =>
      _$EpisodeFromJson(data);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
