import "dart:async";
import "dart:convert";

import "package:chopper/chopper.dart";
import "package:flutter_movie_app/models/movie_list.dart";

class MovieListConverter {
  static FutureOr<Response<MovieList>> response(
    Response<dynamic> response,
  ) async {
    final body = response.body;
    final bodyDecode = json.decode(body as String) as Map<String, dynamic>;
    final bodyParser = MovieList.fromJson(bodyDecode);

    return response.copyWith(body: bodyParser);
  }
}