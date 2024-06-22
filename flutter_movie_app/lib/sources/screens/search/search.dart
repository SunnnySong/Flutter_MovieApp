import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/data/dto/home/movie.dart';
import 'package:flutter_movie_app/sources/screens/search/controllers/search_controller.dart';
import 'package:flutter_movie_app/sources/screens/search/controllers/search_state.dart';
import 'package:flutter_movie_app/sources/wigets/movie_poster_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);

    return Scaffold(
      // backgroundColor: const Color(0xFF0F0F10),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBar(
                  onSubmitted: (value) => ref
                      .read(searchControllerProvider.notifier)
                      .searchMovies(value),
                ),
                const SizedBox(height: 30),
                switch (state) {
                  AsyncData(:final value) => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                      ),
                      itemCount: value.movies.length,
                      itemBuilder: (context, index) => MoviePosterTitleWidget(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${value.movies[index].posterPath}',
                        imageWidth: 91,
                        imageHeight: 143,
                        title: value.movies[index].title,
                        spacing: 5,
                      ),
                    ),
                  AsyncError() => const Text('오류났어요'),
                  AsyncLoading() => const Text('오류났어요'),
                  AsyncValue<SearchState>() => throw UnimplementedError(),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieMock {
  final String title;
  final String posterPath;

  MovieMock({
    required this.title,
    required this.posterPath,
  });
}
