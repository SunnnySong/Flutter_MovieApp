import 'package:flutter_movie_app/sources/network/services/movie_service.dart';
import 'package:flutter_movie_app/sources/network/services/service_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! 앱에서 사용할 Provider 정의
final serviceProvider = Provider<ServiceInterface>((ref) {
  return MovieService.create();
});
