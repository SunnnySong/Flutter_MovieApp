import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'dart:async';

import '../../screens/home/models/movie.dart';
import '../models/response.dart';
import '../network_client/Interceptors.dart';
import 'service_interface.dart';

part 'movie_service.chopper.dart';

const String baseUrl = 'https://api.themoviedb.org/3';

//! 실제 네트워크 서비스를 제공하는 객체
@ChopperApi()
abstract class MovieService extends ChopperService implements ServiceInterface {
  @override
  @FactoryConverter(
    response: movieResponseConverter,
  )
  @Get(path: '/movie/latest')
  Future<MovieResponse> fetchLastedMovie();

  // 실제 네트워크를 실행하는 client 생성 (== URLSession)
  // 하나의 network_service 객체 당 하나의 client 생성
  static MovieService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      interceptors: [
        RequestInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }

  static FutureOr<MovieResponse> movieResponseConverter(Response response) {
    final data = json.decode(response.body);
    final movieData = Movie.fromJson(data);
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