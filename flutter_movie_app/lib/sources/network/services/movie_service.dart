import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/screens/home/models/now_playing_movie.dart';
import 'package:logger/logger.dart';
import 'dart:async';

import '../models/response.dart';
import '../network_client/interceptors.dart';
import 'service_interface.dart';

part 'movie_service.chopper.dart';

const String baseUrl = 'https://api.themoviedb.org/3';

//! 실제 네트워크 서비스를 제공하는 객체
@ChopperApi()
abstract class MovieService extends ChopperService implements ServiceInterface {
  @override
  @FactoryConverter(
    response: movieListResponseConverter,
  )
  @Get(path: '/movie/now_playing')
  Future<MovieListResponse> fetchNowPlayingMovieList({
    @Query('language') String language = "ko-KR",
    @Query('page') int page = 1,
  });

  // 실제 네트워크를 실행하는 client 생성 (== URLSession)
  // 하나의 network_service 객체 당 하나의 client 생성
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

  static FutureOr<MovieListResponse> movieListResponseConverter(
      Response response) {
    final logger = Logger();

    final data = jsonDecode(response.body);

    logger.i("하이루 $data");

    final movieData = MovieList.fromJson(data);
    logger.i("반가워유 ${movieData.results[0].title}");
    final result = Success(movieData);
    return response.copyWith(body: result);
  }
}

//   const endpoint = MovieEndpoint.fetchLastMovies;
  // final path = endpoint.path;
  // var response = client.send(Request(
  //   endpoint.method.name,
  //   Uri.parse(path),
  //   Uri.parse(endpoint.baseUrl),
  // ));