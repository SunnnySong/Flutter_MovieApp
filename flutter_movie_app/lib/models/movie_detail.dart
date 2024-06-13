import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  MovieDetail(
    this.id,
    this.originalTitle,
    this.title,
    this.releaseDate,
    this.productionCountries,
    this.genres,
    this.runtime,
    this.tagline,
    this.overview,
    this.posterPath,
  );

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "original_title")
  final String originalTitle;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "release_date")
  final String releaseDate;

  @JsonKey(name: "production_countries")
  final List<ProductionCountry> productionCountries;

  @JsonKey(name: "genres")
  final List<MovieKind> genres;

  @JsonKey(name: "runtime")
  final int runtime;

  @JsonKey(name: "tagline")
  final String tagline;

  @JsonKey(name: "overview")
  final String overview;

  @JsonKey(name: "poster_path")
  final String? posterPath;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  ProductionCountry(
    this.name,
  );

  @JsonKey(name: "name")
  final String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class MovieKind {
  MovieKind(
    this.name,
  );

  @JsonKey(name: "name")
  final String name;

  factory MovieKind.fromJson(Map<String, dynamic> json) => _$MovieKindFromJson(json);

  Map<String, dynamic> toJson() => _$MovieKindToJson(this);
}
