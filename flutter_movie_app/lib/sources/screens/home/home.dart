import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_controller.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_state.dart';
import 'package:flutter_movie_app/sources/wigets/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: _appBar(),
      backgroundColor: const Color(0xFF0F0F10),
      body: switch (state) {
        AsyncData(:final value) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: _firstSection(context, value, ref),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _secondSection(context, value, ref),
                  ),
                ],
              ),
            ),
          ),
        AsyncError() => const Text('오류났어요'),
        AsyncLoading() => const Text('로딩 중이에요'),
        _ => throw UnimplementedError(),
      },
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F0F10),
      selectedItemColor: const Color(0xFFE64980),
      unselectedItemColor: const Color(0xFFCCCCCC),
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '홈',
        ),
      ],
    );
  }

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

  Widget _firstSection(BuildContext context, HomeState state, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            InteractiveButton(
              onPressed: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .isTappedReleaseButton();
              },
              isSelected: state.releaseButtonState,
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
            InteractiveButton(
              onPressed: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .isTappedPopularityButton();
              },
              isSelected: state.popularityButtonState,
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
        _buildMovieList(context, state),
      ],
    );
  }

  Widget _buildMovieList(BuildContext context, HomeState state) {
    // FutureBuilder를 사용하면 Future가 완료된 것을 감지해 해당 값을 UI에 반영하지만,
    // 값이 변경되었을 때에는 UI를 다시 업데이트하지 않는다.
    // 이를 해결하기 위해 Riverpod의 watch를 사용한다. -> 자동 업데이트 가능

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          final movie = state.movies[index];
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
                      color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  movie.title,
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

  Widget _secondSection(BuildContext context, HomeState state, WidgetRef ref) {
    Widget plusButton = ElevatedButton(
      onPressed: () {
        ref.read(homeControllerProvider.notifier).isTappedAddButton();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF222222),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: const Size.fromHeight(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.addButtonState ? '닫기' : '더보기',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFCCCCCC),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          state.addButtonState
              ? const Icon(
                  Icons.keyboard_arrow_up_outlined,
                  color: Color(0xFFCCCCCC),
                )
              : const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Color(0xFFCCCCCC),
                ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '장르별 영화',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildGenreMovies(context, state),
        const SizedBox(
          height: 10,
        ),
        plusButton,
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildGenreMovies(BuildContext context, HomeState state) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        childAspectRatio: 1.2,
      ),
      itemCount: state.addButtonState ? 15 : 6,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            state.genres[index].name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
