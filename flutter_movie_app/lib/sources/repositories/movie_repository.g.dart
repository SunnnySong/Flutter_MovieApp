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
String _$fetchGenreHash() => r'deed0a68df2116921d548762dcb239a03552aead';

/// See also [fetchGenre].
@ProviderFor(fetchGenre)
final fetchGenreProvider = AutoDisposeFutureProvider<List<Genre>>.internal(
  fetchGenre,
  name: r'fetchGenreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchGenreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchGenreRef = AutoDisposeFutureProviderRef<List<Genre>>;
String _$searchHash() => r'ade7db8320f0b475827f9981135636c31f7d2978';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [search].
@ProviderFor(search)
const searchProvider = SearchFamily();

/// See also [search].
class SearchFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [search].
  const SearchFamily();

  /// See also [search].
  SearchProvider call({
    required String query,
  }) {
    return SearchProvider(
      query: query,
    );
  }

  @override
  SearchProvider getProviderOverride(
    covariant SearchProvider provider,
  ) {
    return call(
      query: provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchProvider';
}

/// See also [search].
class SearchProvider extends AutoDisposeFutureProvider<List<Movie>> {
  /// See also [search].
  SearchProvider({
    required String query,
  }) : this._internal(
          (ref) => search(
            ref as SearchRef,
            query: query,
          ),
          from: searchProvider,
          name: r'searchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchHash,
          dependencies: SearchFamily._dependencies,
          allTransitiveDependencies: SearchFamily._allTransitiveDependencies,
          query: query,
        );

  SearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Movie>> Function(SearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchProvider._internal(
        (ref) => create(ref as SearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
    return _SearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>> with SearchRef {
  _SearchProviderElement(super.provider);

  @override
  String get query => (origin as SearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
