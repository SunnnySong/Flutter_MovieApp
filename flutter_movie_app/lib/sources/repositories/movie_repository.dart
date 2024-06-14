import 'package:flutter_movie_app/sources/data/dto/home/now_playing_movie.dart';
import 'package:flutter_movie_app/sources/network/response.dart';
import 'package:flutter_movie_app/sources/repositories/movie_repository_interface.dart';
import 'package:flutter_movie_app/sources/repositories/services/movie_service.dart';
import 'package:flutter_movie_app/sources/repositories/services/movie_service_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository.g.dart';

class MovieRepository implements MovieRepositoryInterface {
  final MovieServiceInterface _movieService;

  MovieRepository(this._movieService);

  @override
  Future<List<MovieResult>> fetchNowPlayingMovies({
    String language = "ko-KR",
    int page = 1,
  }) async {
    final response = await _movieService.fetchNowPlayingMovies(
      language,
      page,
    );
    final result = response.body;
    if (result is Success<MovieList>) {
      // ignore: avoid_print
      print("하하 ${result.value.results[0].posterPath}");
      return result.value.results;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieResult>> fetchMoviesByReleaseDate() async {
    final movies = await fetchNowPlayingMovies();
    movies.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    return movies;
  }
}

// ! repository provider
@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepository(ref.watch(movieServiceProvider));
}

@riverpod
Future<List<MovieResult>> fetchMoviesByReleaseDate(
    FetchMoviesByReleaseDateRef ref) {
  return ref.watch(movieRepositoryProvider).fetchMoviesByReleaseDate();
}
