import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar_tod/src/data_access/isar/isar_service.dart';
import 'package:isar_tod/src/feature/user/app_user.dart';
import 'package:random_name_generator/random_name_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppUser? lastUser;
  List<AppUser> appUserList = [];
  // Directory? dir;
  // Isar? isar;
  IsarService? isarService;

  // Future<void> addUser() async {
  //   final newUser = AppUser(null, RandomNames(Zone.france).manFullName(),
  //       DateTime.now().add(Duration(days: -365 * Random().nextInt(50))), DateTime.now(), null);

  //   int? id;
  //   await isar!.writeTxn(() async {
  //     id = await isar!.appUserDTOs.put(AppUserDTO.fromAppUser(newUser)); // Insertion & modification
  //   });

  //   getAllUser();
  //   lastUser = await isar!.appUserDTOs.get(id!); // Obtention

  //   setState(() {});
  //   // await isar.writeTxn(() async {
  //   //   await isar.appUserDTOs.delete(existingUser.id!); // Suppression
  //   // });
  // }

  // void getAllUser() async {
  //   await isar!.txn(() async {
  //     var list = await isar!.appUserDTOs.where().findAll();
  //     appUserList = list.reversed.map<AppUser>((e) => e.toAppUser()).toList();
  //   });
  // }

  AppUser newUser() {
    return AppUser(null, RandomNames(Zone.france).manFullName(),
        DateTime.now().add(Duration(days: -365 * Random().nextInt(50))), DateTime.now(), null);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isarService = await IsarService().init(true);
      int id = await isarService!.appUser.addUser(newUser());
      lastUser = await isarService!.appUser.getUser(id);
      appUserList = await isarService!.appUser.getAllUsers();
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
                int id = await isarService!.appUser.addUser(newUser());
                lastUser = await isarService!.appUser.getUser(id);
                appUserList = (await isarService!.appUser.getAllUsers()).reversed.toList();
                setState(() {});
              },
              child: const Icon(Icons.add)),
          body: (isarService != null)
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
