import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "riverpod_setup.g.dart";

/// simple String provider class with notifier method
/// State can be modify and it's autoDispose by default.
/// Class has been converted from simple provider function
/// @riverpod
/// String helloMars(HelloMarsRef ref) => "Hello Mars";
@riverpod
class HelloWorld extends _$HelloWorld {
  @override
  String build() => "Hello world";
}

/// simple String provider function
/// with notifier method
/// State can be modify
final greetingProvider = StateProvider<String>((ref) => "burN@");

/// simple String provider function
/// without notifier method
/// State can not be modify
@riverpod
String helloMars(HelloMarsRef ref) => "Hello Mars";

/// simple Future<String> provider function
/// without notifier method
/// State can not be modify
@riverpod
Future<String> futureHelloMars(FutureHelloMarsRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return "Future Mars";
}

@riverpod
FutureOr<String> myFutureOrFunc(MyFutureOrFuncRef ref) {
  return "What the hell is this!";
}

/// simple int provider class
/// State can be modify and it's keepAlive by default.
@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
