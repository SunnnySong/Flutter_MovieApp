import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/screens/search/controllers/search_controller.dart';
import 'package:flutter_movie_app/sources/screens/search/controllers/search_state.dart';
import 'package:flutter_movie_app/sources/wigets/movie_poster_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchControllerProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 30),
              _buildMovieResults(state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      controller: textController,
      onSubmitted: (value) {
        ref.read(searchControllerProvider.notifier).searchMovies(value);
      },
      backgroundColor: WidgetStateProperty.all(
        const Color(0xFF1C1C1C),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          color: Color(0xFFCCCCCC),
          fontSize: 18,
        ),
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Icon(
          Icons.search,
          color: Color(0xFFCCCCCC),
        ),
      ),
      trailing: [
        ValueListenableBuilder(
          valueListenable: textController,
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                textController.clear();
              },
              icon: textController.text.isNotEmpty
                  ? const Icon(
                      Icons.clear,
                      color: Color(0xFFCCCCCC),
                    )
                  : const SizedBox(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMovieResults(AsyncValue<SearchState> state) {
    return switch (state) {
      AsyncData(:final value) => value.movies.isEmpty
          ? const Center(
              child: Text(
                '검색 결과가 없어요.',
                style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: 15,
                ),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: value.movies.length,
              itemBuilder: (context, index) => MoviePosterTitleWidget(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500/${value.movies[index].posterPath}',
                imageWidth: 91,
                imageHeight: 143,
                title: value.movies[index].title,
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
      AsyncError() => const Text('오류났어요'),
      AsyncLoading() => const Text('로딩 중이에요'),
      AsyncValue<SearchState>() => throw UnimplementedError(),
    };
  }
}
