// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredGamesHash() => r'212e60a2d8f3353fd3c6febbcf20e55db1274c9c';

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

/// See also [filteredGames].
@ProviderFor(filteredGames)
const filteredGamesProvider = FilteredGamesFamily();

/// See also [filteredGames].
class FilteredGamesFamily extends Family<List<GameMetadata>> {
  /// See also [filteredGames].
  const FilteredGamesFamily();

  /// See also [filteredGames].
  FilteredGamesProvider call({
    required String searchQuery,
    required String selectedCategory,
    required Map<String, String> localizedTitles,
  }) {
    return FilteredGamesProvider(
      searchQuery: searchQuery,
      selectedCategory: selectedCategory,
      localizedTitles: localizedTitles,
    );
  }

  @override
  FilteredGamesProvider getProviderOverride(
    covariant FilteredGamesProvider provider,
  ) {
    return call(
      searchQuery: provider.searchQuery,
      selectedCategory: provider.selectedCategory,
      localizedTitles: provider.localizedTitles,
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
  String? get name => r'filteredGamesProvider';
}

/// See also [filteredGames].
class FilteredGamesProvider extends AutoDisposeProvider<List<GameMetadata>> {
  /// See also [filteredGames].
  FilteredGamesProvider({
    required String searchQuery,
    required String selectedCategory,
    required Map<String, String> localizedTitles,
  }) : this._internal(
          (ref) => filteredGames(
            ref as FilteredGamesRef,
            searchQuery: searchQuery,
            selectedCategory: selectedCategory,
            localizedTitles: localizedTitles,
          ),
          from: filteredGamesProvider,
          name: r'filteredGamesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredGamesHash,
          dependencies: FilteredGamesFamily._dependencies,
          allTransitiveDependencies:
              FilteredGamesFamily._allTransitiveDependencies,
          searchQuery: searchQuery,
          selectedCategory: selectedCategory,
          localizedTitles: localizedTitles,
        );

  FilteredGamesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchQuery,
    required this.selectedCategory,
    required this.localizedTitles,
  }) : super.internal();

  final String searchQuery;
  final String selectedCategory;
  final Map<String, String> localizedTitles;

  @override
  Override overrideWith(
    List<GameMetadata> Function(FilteredGamesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredGamesProvider._internal(
        (ref) => create(ref as FilteredGamesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchQuery: searchQuery,
        selectedCategory: selectedCategory,
        localizedTitles: localizedTitles,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<GameMetadata>> createElement() {
    return _FilteredGamesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredGamesProvider &&
        other.searchQuery == searchQuery &&
        other.selectedCategory == selectedCategory &&
        other.localizedTitles == localizedTitles;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);
    hash = _SystemHash.combine(hash, selectedCategory.hashCode);
    hash = _SystemHash.combine(hash, localizedTitles.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredGamesRef on AutoDisposeProviderRef<List<GameMetadata>> {
  /// The parameter `searchQuery` of this provider.
  String get searchQuery;

  /// The parameter `selectedCategory` of this provider.
  String get selectedCategory;

  /// The parameter `localizedTitles` of this provider.
  Map<String, String> get localizedTitles;
}

class _FilteredGamesProviderElement
    extends AutoDisposeProviderElement<List<GameMetadata>>
    with FilteredGamesRef {
  _FilteredGamesProviderElement(super.provider);

  @override
  String get searchQuery => (origin as FilteredGamesProvider).searchQuery;
  @override
  String get selectedCategory =>
      (origin as FilteredGamesProvider).selectedCategory;
  @override
  Map<String, String> get localizedTitles =>
      (origin as FilteredGamesProvider).localizedTitles;
}

String _$categoryStatsHash() => r'915b141f1fff412001a17066a1c94c04e62ceb50';

/// See also [categoryStats].
@ProviderFor(categoryStats)
final categoryStatsProvider = AutoDisposeProvider<Map<String, int>>.internal(
  categoryStats,
  name: r'categoryStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoryStatsRef = AutoDisposeProviderRef<Map<String, int>>;
String _$solvedStatsHash() => r'3a0964f8255b59990f7ee043cae23182a9376f68';

/// See also [solvedStats].
@ProviderFor(solvedStats)
final solvedStatsProvider = AutoDisposeProvider<Map<String, int>>.internal(
  solvedStats,
  name: r'solvedStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$solvedStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SolvedStatsRef = AutoDisposeProviderRef<Map<String, int>>;
String _$solvedTodayCountHash() => r'23f255d11a91c9da2a313aec31210ba998e8d4a0';

/// See also [solvedTodayCount].
@ProviderFor(solvedTodayCount)
final solvedTodayCountProvider = AutoDisposeProvider<int>.internal(
  solvedTodayCount,
  name: r'solvedTodayCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$solvedTodayCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SolvedTodayCountRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
