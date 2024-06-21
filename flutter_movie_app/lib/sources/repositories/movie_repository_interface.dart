import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/data/dto/home/genre.dart';
import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';

abstract class MovieRepositoryInterface {
  Future<List<Movie>> fetchNowPlayingMovies({
    @Query('language') String language,
    @Query('page') int page,
  });

  Future<List<Genre>> fetchGenre({
    @Query('language') String language,
  });

  Future<List<Movie>> search({
    @Query('query') required String query,
    @Query('language') String language,
    @Query('page') int page,
  });

  Future<List<Movie>> fetchMoviesByReleaseDate();

  Future<List<Movie>> fetchMoviesByPopularity();
}
