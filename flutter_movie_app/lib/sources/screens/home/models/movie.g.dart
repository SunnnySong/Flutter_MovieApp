// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      originCountry: (json['originCountry'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalTitle: json['originalTitle'] as String,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originCountry': instance.originCountry,
      'originalTitle': instance.originalTitle,
    };
