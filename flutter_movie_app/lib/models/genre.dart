enum Genre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  scienceFiction,
  thriller,
  war,
  western
}

extension GenreExtension on Genre {
  int get code {
    switch (this) {
      case Genre.action:
        return 28;
      case Genre.adventure:
        return 12;
      case Genre.animation:
        return 16;
      case Genre.comedy:
        return 35;
      case Genre.crime:
        return 80;
      case Genre.documentary:
        return 99;
      case Genre.drama:
        return 18;
      case Genre.family:
        return 10751;
      case Genre.fantasy:
        return 14;
      case Genre.history:
        return 36;
      case Genre.horror:
        return 27;
      case Genre.music:
        return 10402;
      case Genre.mystery:
        return 9648;
      case Genre.romance:
        return 10749;
      case Genre.scienceFiction:
        return 878;
      case Genre.thriller:
        return 53;
      case Genre.war:
        return 10752;
      case Genre.western:
        return 37;
    }
  }

  String get description {
    switch (this) {
      case Genre.action:
        return "액션";
      case Genre.adventure:
        return "어드벤쳐";
      case Genre.animation:
        return "애니메이션";
      case Genre.comedy:
        return "코미디";
      case Genre.crime:
        return "범죄";
      case Genre.documentary:
        return "다큐멘터리";
      case Genre.drama:
        return "드라마";
      case Genre.family:
        return "가족";
      case Genre.fantasy:
        return "판타지";
      case Genre.history:
        return "역사";
      case Genre.horror:
        return "호러";
      case Genre.music:
        return "음악";
      case Genre.mystery:
        return "미스터리";
      case Genre.romance:
        return "로맨스";
      case Genre.scienceFiction:
        return "공상과학";
      case Genre.thriller:
        return "스릴러";
      case Genre.war:
        return "전쟁";
      case Genre.western:
        return "서부극";
    }
  }
}
