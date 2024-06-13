import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  Video(
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
  );

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "key")
  final String key;

  @JsonKey(name: "site")
  final String site;

  @JsonKey(name: "official")
  final bool official;

  @JsonKey(name: "type")
  final String type;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}