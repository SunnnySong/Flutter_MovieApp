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
  Future<Response<Result<MovieList>>> fetchNowPlayingMovieList({
    String language = "ko-KR",
    int page = 1,
  }) {
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
    return client.send<Result<MovieList>, MovieList>(
      $request,
      responseConverter: MovieService.movieListResponseConverter,
    );
  }
}
