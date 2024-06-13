import 'package:flutter/material.dart';
import 'package:flutter_movie_app/provider.dart';
import 'package:flutter_movie_app/sources/network/models/response.dart';
import 'package:flutter_movie_app/sources/screens/home/models/now_playing_movie.dart';
import 'package:flutter_movie_app/sources/wigets/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> get createState => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  //! 속성
  bool _isSelected = true;

  //! 함수
  // 라디오 버튼처럼 A가 선택되면 B는 선택되지 않도록 하는 함수
  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Future<MovieList> _fetchNowPlayingMovieList() async {
    final response = await ref.read(serviceProvider).fetchNowPlayingMovieList();
    final result = response.body;
    if (result is Success<MovieList>) {
      return result.value;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: const Color(0xFF0F0F10),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              _firstSection(context),
            ],
          ),
        ),
      ),
    );
  }

  //! UI
  PreferredSizeWidget _appBar() {
    return AppBar(
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
    );
  }

  Widget _firstSection(BuildContext context) {
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

  Widget _buildMovieList(BuildContext context) {
    return FutureBuilder<MovieList>(
      future: _fetchNowPlayingMovieList(),
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
