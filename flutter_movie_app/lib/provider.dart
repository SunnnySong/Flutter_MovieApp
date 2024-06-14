import 'package:flutter_movie_app/sources/repositories/services/movie_service.dart';
import 'package:flutter_movie_app/sources/repositories/services/movie_service_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! 앱에서 사용할 Provider 정의
final serviceProvider = Provider<MovieServiceInterface>((ref) {
  return MovieService.create();
});
