// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      (json['id'] as num).toInt(),
      json['backdrop_path'] as String,
      json['poster_path'] as String,
      json['original_title'] as String,
      json['title'] as String,
      json['release_date'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'original_title': instance.originalTitle,
      'title': instance.title,
      'release_date': instance.releaseDate,
    };
