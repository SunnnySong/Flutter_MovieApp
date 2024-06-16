import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/data/dto/home/genre.dart';
import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../../network/response.dart';
import '../../network/network_client/interceptors.dart';
import 'movie_service_interface.dart';

part 'movie_service.chopper.dart';
part 'movie_service.g.dart';

const String baseUrl = 'https://api.themoviedb.org/3';

//! 실제 네트워크 서비스를 제공하는 객체
@ChopperApi()
abstract class MovieService extends ChopperService
    implements MovieServiceInterface {
  @override
  @FactoryConverter(
    response: movieListResponseConverter,
  )
  @Get(path: '/movie/now_playing')
  Future<MovieListResponse> fetchNowPlayingMovies(
    @Query('language') String language,
    @Query('page') int page,
  );

  @override
  @FactoryConverter(
    response: genreResponseConverter,
  )
  @Get(path: '/genre/movie/list')
  Future<GenreResponse> fetchGenre(
    @Query('language') String language,
  );

  // * json으로 받아온 response를 MovieListResponse로 변환
  static FutureOr<MovieListResponse> movieListResponseConverter(
      Response response) {
    final data = jsonDecode(response.body);
    final movieData = MovieDTO.fromJson(data);
    final result = Success(movieData);

    return response.copyWith(body: result);
  }

  static FutureOr<GenreResponse> genreResponseConverter(Response response) {
    final data = jsonDecode(response.body);
    final genreData = GenreDTO.fromJson(data);
    final result = Success(genreData);

    return response.copyWith(body: result);
  }

  //! 추후 삭제
  static MovieService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      interceptors: [
        RequestInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: ResponseErrorConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}

@riverpod
MovieService movieService(MovieServiceRef ref) {
  // 실제 네트워크를 실행하는 client 생성 (== URLSession)
  // 하나의 network_service 객체 당 하나의 client 생성
  final client = ChopperClient(
    baseUrl: Uri.parse(baseUrl),
    interceptors: [
      RequestInterceptor(),
    ],
    converter: const JsonConverter(),
    errorConverter: ResponseErrorConverter(),
    services: [
      _$MovieService(),
    ],
  );
  return _$MovieService(client);
}

//   const endpoint = MovieEndpoint.fetchLastMovies;
  // final path = endpoint.path;
  // var response = client.send(Request(
  //   endpoint.method.name,
  //   Uri.parse(path),
  //   Uri.parse(endpoint.baseUrl),
  // ));