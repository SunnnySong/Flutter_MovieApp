// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDescription _$ErrorDescriptionFromJson(Map<String, dynamic> json) =>
    ErrorDescription(
      errorCdoe: (json['errorCdoe'] as num?)?.toInt(),
      errorDescription: json['errorDescription'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ErrorDescriptionToJson(ErrorDescription instance) =>
    <String, dynamic>{
      'errorCdoe': instance.errorCdoe,
      'errorDescription': instance.errorDescription,
      'errorMessage': instance.errorMessage,
    };
