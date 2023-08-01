import 'package:isar/isar.dart';
import 'package:isar_tod/src/data_access/isar/app_user_repo_impl.dart';
import 'package:path_provider/path_provider.dart';

import 'app_user_dto.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;
  IsarService._internal();

  bool isInit = false;
  late AppUserRepoImpl _appUser;

  AppUserRepoImpl get appUser {
    if (!isInit) {
      throw IsarError("IsarService instance isn't initiated. Usage: IsarService().init(<bool>)");
    }
    return _appUser;
  }

  Future<IsarService> init(bool inspector) async {
    final dir = await getApplicationDocumentsDirectory();
    final userSchema = await Isar.open(
      [AppUserDTOSchema],
      directory: dir.path,
      inspector: inspector,
    );
    _appUser = AppUserRepoImpl(dir, userSchema);
    isInit = true;
    return this;
  }
}
