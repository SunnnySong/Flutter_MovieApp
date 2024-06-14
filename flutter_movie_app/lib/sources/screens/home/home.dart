import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/repositories/movie_repository.dart';
import 'package:flutter_movie_app/sources/screens/home/usecases/home_usecase.dart';
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
    // FutureBuilder를 사용하면 Future가 완료된 것을 감지해 해당 값을 UI에 반영하지만,
    // 값이 변경되었을 때에는 UI를 다시 업데이트하지 않는다.
    // 이를 해결하기 위해 Riverpod의 watch를 사용한다. -> 자동 업데이트 가능
    final movies = ref.watch(fetchMoviesByReleaseDateProvider);
    // ignore: avoid_print
    // print(movies);

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.value?.length,
        itemBuilder: (context, index) {
          final movie = movies.value?[index];
          // ignore: avoid_print
          // print(movie?.posterPath);
          // ignore: avoid_print
          print(movie?.title);
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
                    color: movie?.posterPath == null ? Colors.red : null,
                    image: movie?.posterPath != null
                        ? DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${movie?.posterPath}'),
                            fit: BoxFit.cover,
                          )
                        : null,
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
  }
}
