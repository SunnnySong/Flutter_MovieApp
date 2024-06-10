import "dart:async";

import "package:chopper/chopper.dart";
import "package:flutter_movie_app/components/api_config.dart";
import "package:flutter_movie_app/models/movie_list.dart";
import "package:flutter_movie_app/models/movie_list_converter.dart";
import "package:flutter_movie_app/network/network_interceptor.dart";

part 'movie_service.chopper.dart';

@ChopperApi(baseUrl: '/3')
abstract class MovieService extends ChopperService {

  @FactoryConverter(response: MovieListConverter.response)
  @Get(path: '/movie/popular')
  Future<Response<MovieList>> getPopularMovies({@Query("page") int page = 1});

  @Get(path: '/movie/top_rated')
  Future<Response> getTopRatedMovies({@Query("page") int page = 1});

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConfig.BASE_API_URL),
      services: [
        _$MovieService(),
      ],
      interceptors: [
        NetworkInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$MovieService(client);
  }
}
