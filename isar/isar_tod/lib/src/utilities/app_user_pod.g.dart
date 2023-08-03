// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_pod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserRepoHash() => r'1f3b5d0fa59691de4a579fc46acec5c68745d222';

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
String _$appUsersStreamHash() => r'10e9a538ec4f3b0afc1572ae1b9a16b8c24f3999';

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
