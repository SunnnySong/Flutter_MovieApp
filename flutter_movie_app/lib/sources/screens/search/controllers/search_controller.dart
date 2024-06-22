import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
import 'package:flutter_movie_app/sources/repositories/movie_repository.dart';
import 'package:flutter_movie_app/sources/screens/search/controllers/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<SearchState> build() {
    return SearchState([]);
  }

  void searchMovies(String query) async {
    final newMovies = await ref.watch(searchProvider(query: query).future);

    // ignore: avoid_print
    print(newMovies);

    state = AsyncValue.data(
      SearchState(
        newMovies,
      ),
    );
  }
}
