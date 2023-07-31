import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod_setup.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:word_generator/word_generator.dart';
import 'string_extension.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late String world;
  late String greeting;
  late String mars;
  late AsyncValue<String> futureMars;
  late AsyncValue<String> myFutureOrWtf;

  late StateNotifier greetingNotifier;
  late HelloWorld worldNotifier;
  // late var myFutureOrWtfNotifier;
  // late var futureMarsNotifier;
  // late var marsNotifier;

  @override
  void initState() {
    super.initState();
    greetingNotifier = ref.read(greetingProvider.notifier);
    worldNotifier = ref.read(helloWorldProvider.notifier);
    /** 
     * There's no notifier method for those
     * 
     * marsNotifier = ref.read(helloMarsProvider.notifier);
     * futureMarsNotifier = ref.read(futureHelloMarsProvider.notifier);
     * myFutureOrWtfNotifier = ref.read(myFutureOrFuncProvider.notifier);
     */
  }

  @override
  Widget build(BuildContext context) {
    _initWatch();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              world,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              greeting,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              mars,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              myFutureOrWtf.when(
                data: (data) => data,
                error: (error, stackTrace) => error.toString(),
                loading: () => "Loading...",
              ),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              futureMars.when(
                data: (data) => data,
                error: (error, stackTrace) => error.toString(),
                loading: () => "loading...",
              ),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: _doStuff,
                icon: const Icon(Icons.countertops),
                label: const Text("Counter page")),
          ],
        ),
      )),
    );
  }

  void _doStuff() async {
    Navigator.pushNamed(context, "/counter");
    Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      greetingNotifier.state = RandomNames(Zone.france).manFullName();
      worldNotifier.state =
          WordGenerator().randomSentence(Random().nextInt(3) + 2).capitalize();
    });
  }

  void _initWatch() {
    world = ref.watch(helloWorldProvider);
    greeting = ref.watch(greetingProvider);
    mars = ref.watch(helloMarsProvider);
    futureMars = ref.watch(futureHelloMarsProvider);
    myFutureOrWtf = ref.watch(myFutureOrFuncProvider);
  }
}
