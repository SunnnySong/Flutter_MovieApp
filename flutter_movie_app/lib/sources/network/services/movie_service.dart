import 'package:chopper/chopper.dart';
import "dart:async";

import '../network_client/Endpoint.dart';

part "movie_service.chopper.dart";

@ChopperApi()
abstract class MovieService extends ChopperService {
  static MovieService create([ChopperClient? client]) => _$MovieService(client);

  Future<Response> getLastedMovie();
}
