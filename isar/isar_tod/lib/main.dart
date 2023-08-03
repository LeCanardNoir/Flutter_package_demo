import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_tod/src/feature/user/app_user.dart';
import 'package:isar_tod/src/utilities/app_user_pod.dart';
import 'package:random_name_generator/random_name_generator.dart';

import 'src/feature/user/app_user_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  AppUser? lastUser;
  List<AppUser> appUserList = [];
  //IsarService? isarService;
  AppUserService? _appUserService;

  AppUser newUser() {
    return AppUser(null, RandomNames(Zone.france).manFullName(),
        DateTime.now().add(Duration(days: -365 * Random().nextInt(50))), DateTime.now(), null);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _appUserService = await ref.watch(appUserServiceProvider.future);
      int id = await _appUserService!.addUser(newUser());
      lastUser = await _appUserService!.getUser(id);
      appUserList = await _appUserService!.getAllUser();
      appUserList = appUserList.reversed.toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () async {
                int id = await _appUserService!.addUser(newUser());
                lastUser = await _appUserService!.getUser(id);
                appUserList = (await _appUserService!.getAllUser()).reversed.toList();
                setState(() {});
              },
              child: const Icon(Icons.add)),
          body: (_appUserService != null)
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.amber,
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ], color: Colors.amber),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              lastUser?.name ?? "loading",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 500,
                            child: ListView.builder(
                              itemCount: appUserList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  //leading: Text(appUserList[index].id.toString()),
                                  title: Text(
                                    appUserList[index].name,
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${(appUserList[index].created.difference(appUserList[index].birthday).inDays / 365.2425).toStringAsFixed(0)} ans",
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(appUserList[index].bio!)
                                      ]),
                                );
                              },
                            ),
                          ),
                        )
                      ]),
                )
              : const Text("Initiate")),
    );
  }
}
