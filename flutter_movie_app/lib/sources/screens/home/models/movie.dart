import 'package:json_annotation/json_annotation.dart';

part "movie.g.dart";

@JsonSerializable()
class Movie {
  int id;
  List<String> originCountry;
  String originalTitle;

  Movie({
    required this.id,
    required this.originCountry,
    required this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
