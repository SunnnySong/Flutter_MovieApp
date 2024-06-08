import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int id;
  @JsonKey(name: 'origin_country')
  List<String> originCountry;
  @JsonKey(name: 'original_title')
  String originalTitle;

  Movie({
    required this.id,
    required this.originCountry,
    required this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
