// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieSearchService extends MovieSearchService {
  _$MovieSearchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieSearchService;

  @override
  Future<Response<List<Movie>>> getMovie(String movieName) {
    final Uri $url = Uri.parse('/search/movie');
    final Map<String, dynamic> $params = <String, dynamic>{'query': movieName};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<Movie>, Movie>($request);
  }

  @override
  Future<Response<List<Movie>>> getGenreMovie(
    int genre, {
    int page = 1,
    String sortBy = "revenue.desc",
  }) {
    final Uri $url = Uri.parse('/discover/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'with_genres': genre,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<Movie>, Movie>($request);
  }
}
