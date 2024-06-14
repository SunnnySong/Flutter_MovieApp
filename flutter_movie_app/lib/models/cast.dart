import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  Cast(
    this.name,
    this.profilePath,
    this.character,
  );

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "profile_path")
  final String? profilePath;

  @JsonKey(name: "character")
  final String? character;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
