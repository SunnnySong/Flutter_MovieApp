import 'package:json_annotation/json_annotation.dart';

part 'now_playing_movie.g.dart';

@JsonSerializable()
class MovieList {
  int page;
  List<Movie> results;

  MovieList({
    required this.page,
    required this.results,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}

@JsonSerializable()
class Movie {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  String title;
  bool video;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
