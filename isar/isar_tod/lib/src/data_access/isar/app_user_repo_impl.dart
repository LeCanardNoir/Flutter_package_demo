import 'dart:io';

import 'package:isar/isar.dart';
import 'package:isar_tod/src/feature/user/app_user.dart';

import '../../feature/user/app_user_repo.dart';
import 'app_user_dto.dart';

class AppUserRepoImpl implements AppUserRepo {
  final Directory dir;
  final Isar schema;

  AppUserRepoImpl(this.dir, this.schema);

  @override
  Future<int> addUser(AppUser newUser) async {
    int id = -1;
    await schema.writeTxn(() async {
      id = await schema.appUserDTOs.put(AppUserDTO.fromAppUser(newUser));
    });
    if (id == -1) throw IsarError("no user added");
    return id;
  }

  @override
  Future<List<AppUser>> getAllUsers() async {
    List<AppUser> userList = [];
    await schema.txn(() async {
      List<AppUserDTO> response = await schema.appUserDTOs.where().findAll();
      userList = response.map((e) => e.toAppUser()).toList();
    });
    return userList;
  }

  @override
  Future<AppUser?> getUser(int id) async {
    AppUserDTO? dto = await schema.appUserDTOs.get(id);
    if (dto == null) return null;
    return dto.toAppUser();
  }
}
