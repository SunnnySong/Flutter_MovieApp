import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/data/dto/home/genre.dart';
import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
import 'package:flutter_movie_app/sources/network/response.dart';

//! response model 정의
typedef MovieListResponse = Response<Result<MovieDTO>>;
typedef GenreResponse = Response<Result<GenreDTO>>;

//! 네트워크 서비스에 대한 청사진을 제공하는 인터페이스.
// service 객체는 해당 인터페이스를 채택해 세부 구현을 한다.
abstract class MovieServiceInterface {
  Future<MovieListResponse> fetchNowPlayingMovies(
    @Query('language') String language,
    @Query('page') int page,
  );
  Future<GenreResponse> fetchGenre(
    @Query('language') String language,
  );
}
