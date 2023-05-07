// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlePokemonHash() => r'28d575c001e36652f881b7340f2641132152e9f1';

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

typedef SinglePokemonRef = AutoDisposeFutureProviderRef<Pokemon>;

/// See also [singlePokemon].
@ProviderFor(singlePokemon)
const singlePokemonProvider = SinglePokemonFamily();

/// See also [singlePokemon].
class SinglePokemonFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [singlePokemon].
  const SinglePokemonFamily();

  /// See also [singlePokemon].
  SinglePokemonProvider call(
    int id,
  ) {
    return SinglePokemonProvider(
      id,
    );
  }

  @override
  SinglePokemonProvider getProviderOverride(
    covariant SinglePokemonProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'singlePokemonProvider';
}

/// See also [singlePokemon].
class SinglePokemonProvider extends AutoDisposeFutureProvider<Pokemon> {
  /// See also [singlePokemon].
  SinglePokemonProvider(
    this.id,
  ) : super.internal(
          (ref) => singlePokemon(
            ref,
            id,
          ),
          from: singlePokemonProvider,
          name: r'singlePokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlePokemonHash,
          dependencies: SinglePokemonFamily._dependencies,
          allTransitiveDependencies:
              SinglePokemonFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is SinglePokemonProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
