import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/network/network_client/Interceptors.dart';
import 'package:flutter_movie_app/sources/network/services/movie_service.dart';

//! 안쓰는 파일
class NetworkClient {
  // private한 빈 생성자 생성
  /* 빈 생성자를 생성한 이유
  - Dart에서는 생성자가 없을 경우 자동으로 public한 생성자를 만든다. 
  - 때문에 이를 막기 위해 private한 빈 생성자를 만드는 것이다.
  */
  NetworkClient._constructor() {
    _createClient();
  }

  // 생성자 호출하고 반환된 싱글톤 인스턴스를 _instance 변수에 할당한다.
  static final NetworkClient _instance = NetworkClient._constructor();

  // NetworkClient()를 호출하면 _instance를 반환한다.
  factory NetworkClient() {
    return _instance;
  }

  ChopperClient? client;

  void _createClient() {
    client ??= ChopperClient(
      services: [
        MovieService.create(),
      ],
      interceptors: [
        RequestInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
    );
  }
}
