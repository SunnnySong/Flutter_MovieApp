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
  Future<InvalidType> fetchLastedMovie() async {
    final Uri $url = Uri.parse('/movie/latest');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response =
        await client.send<InvalidType, InvalidType>($request);
    return $response.bodyOrThrow;
  }
}
