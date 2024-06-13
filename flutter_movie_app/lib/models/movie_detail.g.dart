// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      (json['id'] as num).toInt(),
      json['original_title'] as String,
      json['title'] as String,
      json['release_date'] as String,
      (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['genres'] as List<dynamic>)
          .map((e) => MovieKind.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['runtime'] as num).toInt(),
      json['tagline'] as String,
      json['overview'] as String,
      json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'production_countries': instance.productionCountries,
      'genres': instance.genres,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      json['name'] as String,
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

MovieKind _$MovieKindFromJson(Map<String, dynamic> json) => MovieKind(
      json['name'] as String,
    );

Map<String, dynamic> _$MovieKindToJson(MovieKind instance) => <String, dynamic>{
      'name': instance.name,
    };
