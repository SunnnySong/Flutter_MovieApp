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
  Future<Response<MovieList>> getPopularMovies({int page = 1}) {
    final Uri $url = Uri.parse('/movie/popular');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieList, MovieList>($request);
  }

  @override
  Future<Response<MovieDetail>> getMovieDetail(int movieId) {
    final Uri $url = Uri.parse('/movie/${movieId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MovieDetail, MovieDetail>($request);
  }

  @override
  Future<Response<List<Cast>>> getMovieCredits(int movieId) {
    final Uri $url = Uri.parse('/movie/${movieId}/credits');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Cast>, Cast>($request);
  }

  @override
  Future<Response<USCertification>> getMoviesCertification(int movieId) {
    final Uri $url = Uri.parse('/movie/${movieId}/release_dates');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<USCertification, USCertification>(
      $request,
      responseConverter: CertificationConverter.response,
    );
  }

  @override
  Future<Response<List<Video>>> getMovieTeasers(int movieId) {
    final Uri $url = Uri.parse('/movie/${movieId}/videos');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Video>, Video>(
      $request,
      responseConverter: TeasersConverter.response,
    );
  }
}
