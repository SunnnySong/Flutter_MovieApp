import 'package:flutter/material.dart';
import 'package:flutter_movie_app/provider.dart';
import 'package:flutter_movie_app/sources/network/models/response.dart';
import 'package:flutter_movie_app/sources/screens/home/models/now_playing_movie.dart';
import 'package:flutter_movie_app/sources/wigets/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';

import 'package:flutter_movie_app/sources/network/services/movie_service.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> get createState => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '야곰 시네마',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF0F0F10),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.movie_creation_outlined),
            color: const Color(0xFFCCCCCC),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_circle_outline_outlined),
            color: const Color(0xFFCCCCCC),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: const Color(0xFFCCCCCC),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0F0F10),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              FirstSection(),
            ],
          ),
        ),
      ),
    );
  }

  void doNetwork() async {
    final movieService = MovieService.create();
    final response = await movieService.fetchNowPlayingMovieList();
    _logger.i(response);
    final result = response.body;

    if (result is Success<MovieList>) {
      _logger.i(result.value.results[0].title);
    } else if (result is Error<MovieList>) {
      _logger.i(result.exception);
    }
  }
}

class FirstSection extends ConsumerStatefulWidget {
  const FirstSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> get createState => _FirstSectionState();
}

class _FirstSectionState extends ConsumerState<FirstSection> {
  bool _isSelected = true;

  // 라디오 버튼처럼 A가 선택되면 B는 선택되지 않도록 하는 함수
  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Button(
                onPressed: () {
                  _toggleSelected();
                },
                isSelected: _isSelected,
                deselectedStyle: ButtonDecorationStyle(
                  backgroundColor: Colors.transparent,
                  foregroundColor: const Color(0xFFCCCCCC),
                  borderColor: const Color(0xFF444444),
                  borderWidth: 1,
                ),
                selectedStyle: ButtonDecorationStyle(
                  backgroundColor: const Color(0xFFe64980),
                  foregroundColor: Colors.white,
                ),
                text: "영화개봉순",
                cornerRadius: 48,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                verticalPadding: 13,
                horizantalPadding: 16,
              ),
              const SizedBox(
                width: 12,
              ),
              Button(
                onPressed: () {
                  _toggleSelected();
                },
                isSelected: !_isSelected,
                deselectedStyle: ButtonDecorationStyle(
                  backgroundColor: Colors.transparent,
                  foregroundColor: const Color(0xFFCCCCCC),
                  borderColor: const Color(0xFF444444),
                  borderWidth: 1,
                ),
                selectedStyle: ButtonDecorationStyle(
                  backgroundColor: const Color(0xFFe64980),
                  foregroundColor: Colors.white,
                ),
                text: "예매율순",
                cornerRadius: 48,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                verticalPadding: 13,
                horizantalPadding: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _buildMovieList(context),
        ],
      ),
    );
  }

  Future<MovieList> fetchNowPlayingMovieList() async {
    final logger = Logger();
    logger.i("heelo");

    final response = await ref.read(serviceProvider).fetchNowPlayingMovieList();
    logger.i("왜 안나오지 {$response}");
    final result = response.body;
    if (result is Success<MovieList>) {
      logger.i(result.value.results[0].title);

      return result.value;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Widget _buildMovieList(BuildContext context) {
    return FutureBuilder<MovieList>(
      future: fetchNowPlayingMovieList(),
      builder: (context, snapshot) {
        return SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.results.length ?? 0,
            itemBuilder: (context, index) {
              final movie = snapshot.data?.results[index];
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 198,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${movie?.posterPath}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      movie?.title ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
