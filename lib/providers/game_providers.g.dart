// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredGamesHash() => r'373ec2e724d5642b0556146587e57becf290fa2f';

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
class FilteredGamesFamily extends Family<List<Map<String, dynamic>>> {
  /// See also [filteredGames].
  const FilteredGamesFamily();

  /// See also [filteredGames].
  FilteredGamesProvider call({
    required String searchQuery,
    required String selectedCategory,
  }) {
    return FilteredGamesProvider(
      searchQuery: searchQuery,
      selectedCategory: selectedCategory,
    );
  }

  @override
  FilteredGamesProvider getProviderOverride(
    covariant FilteredGamesProvider provider,
  ) {
    return call(
      searchQuery: provider.searchQuery,
      selectedCategory: provider.selectedCategory,
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
class FilteredGamesProvider
    extends AutoDisposeProvider<List<Map<String, dynamic>>> {
  /// See also [filteredGames].
  FilteredGamesProvider({
    required String searchQuery,
    required String selectedCategory,
  }) : this._internal(
          (ref) => filteredGames(
            ref as FilteredGamesRef,
            searchQuery: searchQuery,
            selectedCategory: selectedCategory,
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
  }) : super.internal();

  final String searchQuery;
  final String selectedCategory;

  @override
  Override overrideWith(
    List<Map<String, dynamic>> Function(FilteredGamesRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Map<String, dynamic>>> createElement() {
    return _FilteredGamesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredGamesProvider &&
        other.searchQuery == searchQuery &&
        other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);
    hash = _SystemHash.combine(hash, selectedCategory.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredGamesRef on AutoDisposeProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `searchQuery` of this provider.
  String get searchQuery;

  /// The parameter `selectedCategory` of this provider.
  String get selectedCategory;
}

class _FilteredGamesProviderElement
    extends AutoDisposeProviderElement<List<Map<String, dynamic>>>
    with FilteredGamesRef {
  _FilteredGamesProviderElement(super.provider);

  @override
  String get searchQuery => (origin as FilteredGamesProvider).searchQuery;
  @override
  String get selectedCategory =>
      (origin as FilteredGamesProvider).selectedCategory;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
