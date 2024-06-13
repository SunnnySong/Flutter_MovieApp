// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['name'] as String,
      json['key'] as String,
      json['site'] as String,
      json['type'] as String,
      json['official'] as bool,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'official': instance.official,
      'type': instance.type,
    };
