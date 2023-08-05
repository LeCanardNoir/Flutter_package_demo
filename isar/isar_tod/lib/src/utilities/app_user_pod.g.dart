// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_pod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserRepoHash() => r'0e8d391285b6a30b8d9b7a6f71c1eafd9e863de2';

/// See also [appUserRepo].
@ProviderFor(appUserRepo)
final appUserRepoProvider = AutoDisposeFutureProvider<AppUserRepo>.internal(
  appUserRepo,
  name: r'appUserRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appUserRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserRepoRef = AutoDisposeFutureProviderRef<AppUserRepo>;
String _$appUserServiceHash() => r'e428d652991c4928370d86dc6bc7abdefb997b9f';

/// See also [appUserService].
@ProviderFor(appUserService)
final appUserServiceProvider =
    AutoDisposeFutureProvider<AppUserService>.internal(
  appUserService,
  name: r'appUserServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserServiceRef = AutoDisposeFutureProviderRef<AppUserService>;
String _$appUsersStreamHash() => r'fb7537a1d8dc42a4a165c5538422729da82127be';

/// See also [appUsersStream].
@ProviderFor(appUsersStream)
final appUsersStreamProvider =
    AutoDisposeStreamProvider<List<AppUser>>.internal(
  appUsersStream,
  name: r'appUsersStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUsersStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUsersStreamRef = AutoDisposeStreamProviderRef<List<AppUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
