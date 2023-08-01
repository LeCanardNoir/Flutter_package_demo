import 'package:isar/isar.dart';
import 'package:isar_tod/src/feature/user/app_user.dart';

part 'app_user_dto.g.dart';

@collection
class AppUserDTO {
  Id id = Isar.autoIncrement;
  final String name;
  final DateTime birthday;
  final DateTime created;
  String? bio;
  AppUserDTO(this.name, this.birthday, this.created, this.bio);

  factory AppUserDTO.fromAppUser(AppUser u) {
    return AppUserDTO(u.name, u.birthday, u.created, u.bio);
  }
  AppUser toAppUser() {
    return AppUser(id, name, birthday, created, bio);
  }
}
