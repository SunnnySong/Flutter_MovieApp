import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/screens/detail/detail.dart';
import 'package:flutter_movie_app/sources/screens/home/home.dart';
import 'package:flutter_movie_app/sources/screens/profile/profile.dart';
import 'package:flutter_movie_app/sources/screens/search/search.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  // tab 화면부터 나열
  home,
  profile,
  test,
  detail,
  search,
}

class AppRouter {
  //! 불필요한 리빌드를 막기 위해 GlobalKey를 사용
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter router() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home',
      // 화면 전환 디버그 로그 출력
      debugLogDiagnostics: true,
      observers: [CustomNavigatorObserver()],
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return Scaffold(
              backgroundColor: const Color(0xFF0F0F10),
              body: navigationShell,
              bottomNavigationBar:
                  _bottomNavigationBar(context, navigationShell),
              appBar: _buildAppBar(context, navigationShell),
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              observers: [CustomNavigatorObserver()],
              navigatorKey: _sectionNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: '/home',
                  name: AppRoute.home.name,
                  builder: (context, state) => Home(
                    // TODO: state.pageKey를 왜 사용하는가?
                    key: state.pageKey,
                  ),
                  routes: [
                    // !! Detail 화면
                    GoRoute(
                      path: 'detail',
                      name: AppRoute.detail.name,
                      builder: (context, state) => Detail(
                        key: state.pageKey,
                      ),
                    ),
                    // !! Search 화면
                    GoRoute(
                      path: 'search',
                      name: AppRoute.search.name,
                      builder: (context, state) => Search(
                        key: state.pageKey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/profile',
                  name: AppRoute.profile.name,
                  builder: (context, state) => Profile(
                    key: state.pageKey,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/test',
                  name: AppRoute.test.name,
                  builder: (context, state) => Scaffold(
                    key: state.pageKey,
                    body: const Center(
                      child: Text(
                        '테스트',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomNavigationBar(
      BuildContext context, StatefulNavigationShell navigationShell) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '프로필',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '테스트',
        ),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (int index) {
        //! 각각의 StatefulshellBranch로 이동
        navigationShell.goBranch(index);
        context.goNamed(AppRoute.values[index].name);
      },
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
    );
  }

  PreferredSizeWidget _buildAppBar(
      BuildContext context, StatefulNavigationShell navigationShell) {
    switch (navigationShell.currentIndex) {
      // home
      case 0:
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
              onPressed: () {
                context.goNamed(AppRoute.search.name);
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFCCCCCC),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: const Color(0xFFCCCCCC),
            ),
          ],
        );
      default:
        return AppBar();
    }
  }
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}

@riverpod
GoRouter router(RouterRef ref) {
  return ref.watch(appRouterProvider).router();
}

// Custom NavigatorObserver for logging navigation events
class CustomNavigatorObserver extends NavigatorObserver {
  void _logStack(String action, Route<dynamic>? route) {
    // ignore: avoid_print
    print('$action: ${route?.settings.name}');
    // 추가로 네비게이션 스택 상태를 출력할 수 있음
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logStack('Push', route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logStack('Pop', route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _logStack('Remove', route);
  }
}
