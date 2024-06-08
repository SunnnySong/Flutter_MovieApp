import 'package:chopper/chopper.dart';

import '../../screens/home/models/movie.dart';
import '../models/response.dart';
import '../network_client/Interceptors.dart';
import 'service_interface.dart';

part 'movie_service.chopper.dart';

const String baseUrl = 'https://api.themoviedb.org/3';

//! 실제 네트워크 서비스를 제공하는 객체
@ChopperApi()
abstract class MovieService extends ChopperService implements ServiceInterface {
  @override
  @Get(path: '/movie/latest')
  Future<MovieResponse> fetchLastedMovie();

  // 실제 네트워크를 실행하는 client 생성 (== URLSession)
  static MovieService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      interceptors: [
        RequestInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}

//   const endpoint = MovieEndpoint.fetchLastMovies;
  // final path = endpoint.path;
  // var response = client.send(Request(
  //   endpoint.method.name,
  //   Uri.parse(path),
  //   Uri.parse(endpoint.baseUrl),
  // ));