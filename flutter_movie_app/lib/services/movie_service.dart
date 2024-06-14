import "package:chopper/chopper.dart";
import "package:flutter_movie_app/components/api_config.dart";
import "package:flutter_movie_app/models/cast.dart";
import "package:flutter_movie_app/models/movie_detail.dart";
import "package:flutter_movie_app/models/movie_list.dart";
import "package:flutter_movie_app/models/us_certification.dart";
import "package:flutter_movie_app/models/video.dart";
import "package:flutter_movie_app/network/certification_converter.dart";
import "package:flutter_movie_app/network/generic_json_converter.dart";
import "package:flutter_movie_app/network/network_interceptor.dart";
import "package:flutter_movie_app/network/teasers_converter.dart";

part 'movie_service.chopper.dart';

@ChopperApi(baseUrl: '/movie')
abstract class MovieService extends ChopperService {

  @Get(path: '/popular')
  Future<Response<MovieList>> getPopularMovies({@Query("page") int page = 1});

  @Get(path: '/{id}')
  Future<Response<MovieDetail>> getMovieDetail(@Path("id") int movieId);

  @Get(path: '/{id}/credits')
  Future<Response<List<Cast>>> getMovieCredits(@Path("id") int movieId);

  @FactoryConverter(response: CertificationConverter.response)
  @Get(path: '/{id}/release_dates')
  Future<Response<USCertification>> getMoviesCertification(@Path("id") int movieId);

  @FactoryConverter(response: TeasersConverter.response)
  @Get(path: '/{id}/videos')
  Future<Response<List<Video>>> getMovieTeasers(@Path("id") int movieId);

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConfig.BASE_API_URL),
      services: [
        _$MovieService(),
      ],
      interceptors: [
        NetworkInterceptor(),
      ],
      converter: GenericJsonConverter({
        MovieList: (json) => MovieList.fromJson(json),
        MovieDetail: (json) => MovieDetail.fromJson(json),
        List<Cast>: (json) => (json['cast'] as List<dynamic>).map((e) => Cast.fromJson(e)).toList(),
      }),
    );
    return _$MovieService(client);
  }
}
