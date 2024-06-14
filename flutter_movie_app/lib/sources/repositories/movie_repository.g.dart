// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieRepositoryHash() => r'd91b1491eec482b2b2dde3983b90c2db3efe6345';

/// See also [movieRepository].
@ProviderFor(movieRepository)
final movieRepositoryProvider = AutoDisposeProvider<MovieRepository>.internal(
  movieRepository,
  name: r'movieRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MovieRepositoryRef = AutoDisposeProviderRef<MovieRepository>;
String _$fetchMoviesByReleaseDateHash() =>
    r'1a7529d10596648aeca0b95d1a8a062887ed3292';

/// See also [fetchMoviesByReleaseDate].
@ProviderFor(fetchMoviesByReleaseDate)
final fetchMoviesByReleaseDateProvider =
    AutoDisposeFutureProvider<List<MovieResult>>.internal(
  fetchMoviesByReleaseDate,
  name: r'fetchMoviesByReleaseDateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMoviesByReleaseDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMoviesByReleaseDateRef
    = AutoDisposeFutureProviderRef<List<MovieResult>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
