import 'package:isar_tod/src/feature/user/app_user.dart';

import 'app_user_repo.dart';

class AppUserService {
  final AppUserRepo repo;
  AppUserService({required this.repo});

  Future<List<AppUser>> getAllUser() async {
    List<AppUser> users = await repo.getAllUsers();
    return users;
  }

  Future<AppUser?> getUser(int id) async {
    AppUser? user = await repo.getUser(id);
    return user;
  }

  Future<int> addUser(AppUser newUser) async {
    int id = await repo.addUser(newUser);
    return id;
  }
}
