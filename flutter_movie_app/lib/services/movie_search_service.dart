import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/components/api_config.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/network/generic_json_converter.dart';
import 'package:flutter_movie_app/network/network_interceptor.dart';

part 'movie_search_service.chopper.dart';

@ChopperApi()
abstract class MovieSearchService extends ChopperService {
  @Get(path: '/search/movie')
  Future<Response<List<Movie>>> getMovie(@Query("query") String movieName);

  @Get(path: '/discover/movie')
  Future<Response<List<Movie>>> getGenreMovie(
    @Query("with_genres") int genre, {
    @Query("page") int page = 1,
    @Path("sort_by") String sortBy = "revenue.desc",
  });

  static MovieSearchService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConfig.BASE_API_URL),
      services: [
        _$MovieSearchService(),
      ],
      interceptors: [
        NetworkInterceptor(),
      ],
      converter: GenericJsonConverter({
        List<Movie>: (json) => (json['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList(),
      }),
    );
    return _$MovieSearchService(client);
  }
}
