import 'package:flutter_movie_app/sources/repositories/movie_repository.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    return _fetchData();
  }

  Future<HomeState> _fetchData() async {
    final movies = await ref.watch(fetchMoviesByReleaseDateProvider.future);
    return HomeState(movies: movies);
  }
}
