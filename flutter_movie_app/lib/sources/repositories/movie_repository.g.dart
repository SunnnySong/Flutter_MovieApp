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
    r'a8855799e458d45cb80e6db40e6770f6e00bb721';

/// See also [fetchMoviesByReleaseDate].
@ProviderFor(fetchMoviesByReleaseDate)
final fetchMoviesByReleaseDateProvider =
    AutoDisposeFutureProvider<List<Movie>>.internal(
  fetchMoviesByReleaseDate,
  name: r'fetchMoviesByReleaseDateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMoviesByReleaseDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMoviesByReleaseDateRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$fetchMoviesByPopularityHash() =>
    r'e1f3ec0037225c761fc5358ec55c9b2bd77b9e1e';

/// See also [fetchMoviesByPopularity].
@ProviderFor(fetchMoviesByPopularity)
final fetchMoviesByPopularityProvider =
    AutoDisposeFutureProvider<List<Movie>>.internal(
  fetchMoviesByPopularity,
  name: r'fetchMoviesByPopularityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMoviesByPopularityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMoviesByPopularityRef = AutoDisposeFutureProviderRef<List<Movie>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
