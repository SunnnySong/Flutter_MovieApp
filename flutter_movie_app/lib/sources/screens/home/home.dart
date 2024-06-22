import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_controller.dart';
import 'package:flutter_movie_app/sources/screens/home/controllers/home_state.dart';
import 'package:flutter_movie_app/sources/wigets/interactive_button.dart';
import 'package:flutter_movie_app/sources/wigets/movie_poster_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    ScrollController scrollController = ScrollController();

    return state.when(
      data: (homeState) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  bottom: 18,
                ),
                child: Column(
                  children: [
                    ..._firstSection(context, homeState, ref),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 8,
                color: const Color(0xFF060606),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._secondSection(
                        context, homeState, ref, scrollController),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        );
      },
      error: (error, stack) {
        return Center(
          child: Text('Error: $error'),
        );
      },
    );
  }

  List<Widget> _firstSection(
      BuildContext context, HomeState state, WidgetRef ref) {
    ScrollController scrollController = ScrollController();

    return [
      Row(
        children: [
          InteractiveButton(
            onPressed: () {
              ref.read(homeControllerProvider.notifier).isTappedReleaseButton();

              scrollController.jumpTo(0);
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

              scrollController.jumpTo(0);
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
        height: 15,
      ),
      _buildMovieList(
        context,
        state,
        scrollController,
      ),
    ];
  }

  Widget _buildMovieList(
    BuildContext context,
    HomeState state,
    ScrollController scrollController,
  ) {
    // FutureBuilder를 사용하면 Future가 완료된 것을 감지해 해당 값을 UI에 반영하지만,
    // 값이 변경되었을 때에는 UI를 다시 업데이트하지 않는다.
    // 이를 해결하기 위해 Riverpod의 watch를 사용한다. -> 자동 업데이트 가능

    return AspectRatio(
      // 가로 / 세로 비율
      aspectRatio: 16 / 10,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          final movie = state.movies[index];
          return MoviePosterTitleWidget(
            imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            imageWidth: 140,
            imageHeight: 198,
            title: movie.title,
            spacing: 12,
          );
        },
      ),
    );
  }

  List<Widget> _secondSection(
    BuildContext context,
    HomeState state,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    final GlobalKey secondSectionKey = GlobalKey();

    Widget plusButton = ElevatedButton(
      onPressed: () {
        ref.read(homeControllerProvider.notifier).isTappedAddButton();

        // https://inma06.tistory.com/125
        final RenderBox renderBox =
            secondSectionKey.currentContext?.findRenderObject() as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);

        // ignore: avoid_print
        print(scrollController);

        scrollController.animateTo(
          !state.addButtonState ? offset.dy / 2 : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      key: secondSectionKey,
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

    return [
      const Text(
        '장르별 영화',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      _buildGenreMovies(state),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: plusButton,
      ),
    ];
  }

  Widget _buildGenreMovies(HomeState state) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        childAspectRatio: 1.3,
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
