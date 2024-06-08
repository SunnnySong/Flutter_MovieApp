import 'package:chopper/chopper.dart';

import '../../screens/home/models/movie.dart';
import '../models/response.dart';

//! response model 정의
typedef MovieResponse = Response<Result<Movie>>;

//! 네트워크 서비스에 대한 청사진을 제공하는 인터페이스.
// service 객체는 해당 인터페이스를 채택해 세부 구현을 한다.
abstract class ServiceInterface {
  Future<MovieResponse> fetchLastedMovie();
}
