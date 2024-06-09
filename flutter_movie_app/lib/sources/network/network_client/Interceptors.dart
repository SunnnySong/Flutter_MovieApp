import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/sources/network/models/http_status.dart';

class RequestInterceptor implements Interceptor {
  // 나중엔 이 토큰을 다른 곳에다 저장해서 불러오기
  final String _token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzE5ZmEwOGQ1ZmRhMjBjNzAwMzIzYmMwOWIyYjZlMSIsInN1YiI6IjY2NWQ2OWNkODJhMDZhMzQ5YjkwNzUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GMd-UQxf8HdKQId_k9OUQ3ZYCXt9KMfFfqZGCPKl9cI";

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request =
        applyHeader(chain.request, "Authorization", 'Bearer $_token');
    return chain.proceed(request);
  }
}

class ResponseErrorConverter implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    if (!response.isSuccessful) {
      chopperLogger.severe('‼️ 오류 발생 / statusCode: ${response.statusCode}');
    }
    return response.copyWith(
      bodyError: HttpStatusDescription.errorDescription(response)?.toJson(),
    );
  }
}
