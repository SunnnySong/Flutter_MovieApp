import 'dart:convert';
import 'package:chopper/chopper.dart';

class GenericJsonConverter extends JsonConverter {
  final Map<Type, Function> typeToFactoryMap;

  const GenericJsonConverter(this.typeToFactoryMap);

  @override
  Request convertRequest(Request request) {
    final body = request.body;
    if (body is Map<String, dynamic>) {
      return request.copyWith(
        body: json.encode(body),
      );
    }
    return request;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map<String, dynamic> && typeToFactoryMap.containsKey(BodyType)) {
      final body = typeToFactoryMap[BodyType]!(jsonResponse) as BodyType;
      return response.copyWith<BodyType>(body: body);
    }
    return response.copyWith<BodyType>(body: jsonResponse as BodyType);
  }
}