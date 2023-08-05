import 'package:isar_tod/src/feature/user/app_user.dart';

abstract class AppUserRepo {
  Future<int> addUser(AppUser newUser);
  Future<List<AppUser>> getAllUsers();
  Future<AppUser?> getUser(int id);
  Stream<void> getUsersStream();
}
