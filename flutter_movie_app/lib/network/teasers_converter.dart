import "dart:async";
import "dart:convert";

import "package:chopper/chopper.dart";
import 'package:flutter_movie_app/models/video.dart';

class TeasersConverter {
  static FutureOr<Response<List<Video>>> response(
    Response<dynamic> response,
  ) async {
    final body = response.body;
    final bodyDecode = json.decode(body as String) as Map<String, dynamic>;
    final results = bodyDecode['results'] as List<dynamic>;
    final videos = results.map((e) => Video.fromJson(e as Map<String, dynamic>)).toList();
    final teasers = videos.where((video) {
      return video.site == "YouTube" && video.type == "Teaser" && video.official;
    }).toList();

    return response.copyWith(body: teasers);
  }
}