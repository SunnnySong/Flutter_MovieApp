// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      json['name'] as String,
      json['profile_path'] as String?,
      json['character'] as String?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
    };
