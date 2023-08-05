import 'package:isar/isar.dart';
import 'package:isar_tod/src/feature/user/app_user.dart';

import '../../feature/user/app_user_repo.dart';
import 'app_user_dto.dart';

class AppUserRepoImpl implements AppUserRepo {
  final Isar isar;

  AppUserRepoImpl(this.isar);

  @override
  Future<int> addUser(AppUser newUser) async {
    int id = -1;
    await isar.writeTxn(() async {
      id = await isar.appUserDTOs.put(AppUserDTO.fromAppUser(newUser));
    });
    if (id == -1) throw IsarError("no user added");
    return id;
  }

  @override
  Future<List<AppUser>> getAllUsers() async {
    List<AppUser> userList = [];
    await isar.txn(() async {
      List<AppUserDTO> response = await isar.appUserDTOs.where().findAll();
      userList = response.map((e) => e.toAppUser()).toList();
    });
    return userList;
  }

  @override
  Future<AppUser?> getUser(int id) async {
    AppUserDTO? dto = await isar.appUserDTOs.get(id);
    if (dto == null) return null;
    return dto.toAppUser();
  }

  @override
  Stream<void> getUsersStream() => isar.appUserDTOs.watchLazy();
}
