import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/network/models/response.dart';
import 'package:flutter_movie_app/sources/screens/home/models/now_playing_movie.dart';

//! response model 정의
typedef MovieListResponse = Response<Result<MovieList>>;

//! 네트워크 서비스에 대한 청사진을 제공하는 인터페이스.
// service 객체는 해당 인터페이스를 채택해 세부 구현을 한다.
abstract class ServiceInterface {
  Future<MovieListResponse> fetchNowPlayingMovieList({
    @Query('language') String language,
    @Query('page') int page,
  });
}
