// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseDates _$ReleaseDatesFromJson(Map<String, dynamic> json) => ReleaseDates(
      json['iso_3166_1'] as String,
      json['release_dates'] as List<dynamic>,
    );

Map<String, dynamic> _$ReleaseDatesToJson(ReleaseDates instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso,
      'release_dates': instance.releaseDates,
    };
