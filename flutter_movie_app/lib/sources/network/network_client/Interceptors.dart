import 'dart:async';
import 'package:chopper/chopper.dart';

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
