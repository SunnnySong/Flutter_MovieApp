import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'http_status.g.dart';

@JsonSerializable()
class ErrorDescription {
  final int? errorCdoe;
  final String? errorDescription;
  final String? errorMessage;

  ErrorDescription({
    required this.errorCdoe,
    required this.errorDescription,
    required this.errorMessage,
  });

  Map<String, dynamic> toJson() => _$ErrorDescriptionToJson(this);
}

extension HttpStatusDescription on HttpStatus {
  static ErrorDescription? errorDescription(Response response) {
    switch (response.statusCode) {
      case HttpStatus.unauthorized:
        return ErrorDescription(
            errorCdoe: response.statusCode,
            errorDescription: "Authorization 실패",
            errorMessage: "인증 토큰이 만료되었거나, 유효하지 않습니다.");
      case HttpStatus.methodNotAllowed:
        return ErrorDescription(
            errorCdoe: response.statusCode,
            errorDescription: "method error 발생",
            errorMessage: "해당 메소드가 서버에 존재하지 않습니다.");
      default:
        return jsonDecode(response.error.toString());
    }
  }
}
