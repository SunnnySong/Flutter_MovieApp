import 'package:flutter_movie_app/sources/data/dto/home/genre.dart';
import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
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
  Future<List<Movie>> fetchNowPlayingMovies({
    String language = "ko-KR",
    int page = 1,
  }) async {
    final response = await _movieService.fetchNowPlayingMovies(
      language,
      page,
    );
    final result = response.body;
    if (result is Success<MovieDTO>) {
      // ignore: avoid_print
      print("하하 ${result.value.results[0].posterPath}");
      return result.value.results;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<Genre>> fetchGenre({
    String language = "ko",
  }) async {
    final response = await _movieService.fetchGenre(
      language,
    );
    final result = response.body;
    if (result is Success<GenreDTO>) {
      // ignore: avoid_print
      print("하하 ${result.value.genres[0].name}");
      return result.value.genres;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<Movie>> fetchMoviesByReleaseDate() async {
    final movies = await fetchNowPlayingMovies();
    movies.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    return movies;
  }

  @override
  Future<List<Movie>> fetchMoviesByPopularity() async {
    // 추후 다른 API로 구현
    final movies = await fetchNowPlayingMovies();
    movies.sort((a, b) => b.popularity.compareTo(a.popularity));
    return movies;
  }
}

// ! repository provider
@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepository(ref.watch(movieServiceProvider));
}

@riverpod
Future<List<Movie>> fetchMoviesByReleaseDate(FetchMoviesByReleaseDateRef ref) {
  return ref.watch(movieRepositoryProvider).fetchMoviesByReleaseDate();
}

@riverpod
Future<List<Movie>> fetchMoviesByPopularity(FetchMoviesByPopularityRef ref) {
  return ref.watch(movieRepositoryProvider).fetchMoviesByPopularity();
}

@riverpod
Future<List<Genre>> fetchGenre(FetchGenreRef ref) {
  return ref.watch(movieRepositoryProvider).fetchGenre();
}
