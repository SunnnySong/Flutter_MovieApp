import 'package:flutter_movie_app/sources/data/dto/home/now_playing_movie.dart';

// ! 홈 화면의 상태를 정의 (모든 상태값은 여기에 정의하고 관리함.)
// home.dart에서는 이 상태값을 가져와 UI를 그리는 코드만 존재하도록.
class HomeState {
  List<Movie> movies;

  HomeState({
    required this.movies,
  });
}
