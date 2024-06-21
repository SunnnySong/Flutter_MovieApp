// import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
// import 'package:flutter_movie_app/sources/repositories/movie_repository.dart';
// import 'package:flutter_movie_app/sources/repositories/movie_repository_interface.dart';
// import 'package:flutter_movie_app/sources/repositories/services/movie_service.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'home_usecase.g.dart';

// class HomeUsecase {
//   final MovieRepositoryInterface _movieRepository;

//   HomeUsecase(this._movieRepository);

//   Future<List<Movie>> fetchMoviesByReleaseDate() async {
//     final movies = await _movieRepository.fetchNowPlayingMovies();
//     movies.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

//     return movies;
//   }
// }

// @riverpod
// HomeUsecase homeUsecase(HomeUsecaseRef ref) {
//   final movieService = MovieService.create();
//   final movieRepository = MovieRepository(movieService);
//   return HomeUsecase(movieRepository);
// }
/*
ref.read(homeUsecaseProvider).fetchMoviesByReleaseDate();
이런식으로 사용할 수 있음. 근데 뭐가 더 좋은 방법이지?
*/

  // final MovieRepositoryInterface _movieRepository;

  // HomeUsecase(this._movieRepository);

  // List<MovieResult> movies = await _movieRepository.fetchNowPlayingMovies();
  // movies.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
  // return movies;
