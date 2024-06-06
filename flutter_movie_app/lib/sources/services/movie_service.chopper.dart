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
  Future<Response<dynamic>> getLastedMovie() {
    // @Get(path: '/todos/1')
    // Future<Response> getLastedMovie();

    // 동일한 코드
    /* 어노테이션을 사용하지 못한 이유
    - path가 MovieEndpoint.fetchTestData.path로 extension method로 정의되어있음.
    - 다트에서는 컴파일 타임 상수(constant)로 extension method를 사용할 수 없음.
    */
    final endpoint = MovieEndpoint.fetchLastMovies;
    final path = endpoint.path;

    return client.send(Request(
      endpoint.method.name,
      Uri.parse(path),
      Uri.parse(endpoint.baseUrl),
      headers: {
        "accept": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzE5ZmEwOGQ1ZmRhMjBjNzAwMzIzYmMwOWIyYjZlMSIsInN1YiI6IjY2NWQ2OWNkODJhMDZhMzQ5YjkwNzUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GMd-UQxf8HdKQId_k9OUQ3ZYCXt9KMfFfqZGCPKl9cI"
      },
    ));
  }
}
