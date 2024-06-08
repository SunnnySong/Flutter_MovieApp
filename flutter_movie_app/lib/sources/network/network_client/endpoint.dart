import 'package:flutter_movie_app/sources/network/models/method.dart';

enum MovieEndpoint {
  fetchLastMovies,
  fetchTestData,
}

extension MovieEndpointExtension on MovieEndpoint {
  String get baseUrl {
    return "https://api.themoviedb.org/3";
  }

  String get path {
    switch (this) {
      case MovieEndpoint.fetchLastMovies:
        return "/movie/latest";
      case MovieEndpoint.fetchTestData:
        return "/todos/1";
    }
  }

  HTTPMethod get method {
    switch (this) {
      case MovieEndpoint.fetchLastMovies:
        return HTTPMethod.get;
      case MovieEndpoint.fetchTestData:
        return HTTPMethod.get;
    }
  }
}
