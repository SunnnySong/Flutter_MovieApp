import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/data/dto/home/now_playing_movie.dart';

abstract class MovieRepositoryInterface {
  Future<List<MovieResult>> fetchNowPlayingMovies({
    @Query('language') String language,
    @Query('page') int page,
  });

  Future<List<MovieResult>> fetchMoviesByReleaseDate();
}
