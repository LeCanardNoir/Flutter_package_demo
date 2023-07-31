// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_setup.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloMarsHash() => r'295781eb2d25b8f041189cb9d6df205095c296f9';

/// simple String provider function
/// without notifier method
/// State can not be modify
///
/// Copied from [helloMars].
@ProviderFor(helloMars)
final helloMarsProvider = AutoDisposeProvider<String>.internal(
  helloMars,
  name: r'helloMarsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloMarsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloMarsRef = AutoDisposeProviderRef<String>;
String _$futureHelloMarsHash() => r'7a305f23abe3a85ccb1d498d4df9459fb57de035';

/// simple Future<String> provider function
/// without notifier method
/// State can not be modify
///
/// Copied from [futureHelloMars].
@ProviderFor(futureHelloMars)
final futureHelloMarsProvider = AutoDisposeFutureProvider<String>.internal(
  futureHelloMars,
  name: r'futureHelloMarsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$futureHelloMarsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FutureHelloMarsRef = AutoDisposeFutureProviderRef<String>;
String _$myFutureOrFuncHash() => r'535d6d4b34ea2cff705587701c94b84865d9edb5';

/// See also [myFutureOrFunc].
@ProviderFor(myFutureOrFunc)
final myFutureOrFuncProvider = AutoDisposeFutureProvider<String>.internal(
  myFutureOrFunc,
  name: r'myFutureOrFuncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myFutureOrFuncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyFutureOrFuncRef = AutoDisposeFutureProviderRef<String>;
String _$helloWorldHash() => r'e0421f9b9201b969963badf57128a7148c3ea607';

/// simple String provider class with notifier method
/// State can be modify and it's autoDispose by default.
/// Class has been converted from simple provider function
/// @riverpod
/// String helloMars(HelloMarsRef ref) => "Hello Mars";
///
/// Copied from [HelloWorld].
@ProviderFor(HelloWorld)
final helloWorldProvider =
    AutoDisposeNotifierProvider<HelloWorld, String>.internal(
  HelloWorld.new,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HelloWorld = AutoDisposeNotifier<String>;
String _$counterHash() => r'f73eba1bee51b530a8184c934dee4b1630005cff';

/// simple int provider class
/// State can be modify and it's keepAlive by default.
///
/// Copied from [Counter].
@ProviderFor(Counter)
final counterProvider = NotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = Notifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
