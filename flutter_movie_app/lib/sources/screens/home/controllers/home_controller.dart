import 'package:flutter_movie_app/sources/data/dto/home/now_playing_movie.dart';
import 'package:flutter_movie_app/sources/repositories/movie_repository.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    return _init();
  }

  Future<HomeState> _init() async {
    final movies = await _fetchMoviesByReleaseDate();
    return HomeState(movies: movies);
  }

  Future<List<Movie>> _fetchMoviesByReleaseDate() async {
    return await ref.watch(fetchMoviesByReleaseDateProvider.future);
  }

  Future<List<Movie>> _fetchMoviesByPopularity() async {
    return await ref.watch(fetchMoviesByPopularityProvider.future);
  }

  void toggleReleaseButton() async {
    //? 이런 식으로 접근하면 state 객체 자체가 변경되는 것이 아니기 때문에(기존 state객체가 변경) StateNotifier가 변경을 감지하지 못함.
    //? 따라서 상태를 변경하고 싶다면 새로운 객체를 생성하고 해당 객체를 state에 할당해야 함.
    // state.value?.releaseButtonState = true;
    // state.value?.popularityButtonState = false;
    // state.value?.movies = await _fetchMoviesByReleaseDate();
    // ref.notifyListeners();

    //! StateNotifier를 사용해 state값이 변경되었을 때 해당 state값을 구독하고 있는 위젯들은
    //! 이 변화를 감지하고 UI를 업데이트하도록 함.
    // https://riverpod.dev/ko/docs/providers/notifier_provider
    final newMovies = await _fetchMoviesByReleaseDate();
    state = AsyncValue.data(
      HomeState(
        movies: newMovies,
        releaseButtonState: true,
        popularityButtonState: false,
      ),
    );
  }

  void togglePopularityButton() async {
    final newMovies = await _fetchMoviesByPopularity();
    state = AsyncValue.data(
      HomeState(
        movies: newMovies,
        releaseButtonState: false,
        popularityButtonState: true,
      ),
    );
  }
}
