// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieService extends MovieService {
  _$MovieService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieService;

  @override
  Future<Response<Result<MovieDTO>>> fetchNowPlayingMovies(
    String language,
    int page,
  ) {
    final Uri $url = Uri.parse('/movie/now_playing');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<MovieDTO>, MovieDTO>(
      $request,
      responseConverter: MovieService.movieListResponseConverter,
    );
  }

  @override
  Future<Response<Result<GenreDTO>>> fetchGenre(String language) {
    final Uri $url = Uri.parse('/genre/movie/list');
    final Map<String, dynamic> $params = <String, dynamic>{
      'language': language
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<GenreDTO>, GenreDTO>(
      $request,
      responseConverter: MovieService.genreResponseConverter,
    );
  }

  @override
  Future<Response<Result<MovieDTO>>> search(
    String query,
    String language,
    int page,
  ) {
    final Uri $url = Uri.parse('/search/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'language': language,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Result<MovieDTO>, MovieDTO>(
      $request,
      responseConverter: MovieService.movieListResponseConverter,
    );
  }
}
