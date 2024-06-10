import 'package:flutter_movie_app/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list.g.dart';

@JsonSerializable()
class MovieList {
  MovieList(
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  );

  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "results")
  final List<Movie> movies;

  @JsonKey(name: "total_pages")
  final int totalPages;

  @JsonKey(name: "total_results")
  final int totalResults;

  factory MovieList.fromJson(Map<String, dynamic> json) => _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
