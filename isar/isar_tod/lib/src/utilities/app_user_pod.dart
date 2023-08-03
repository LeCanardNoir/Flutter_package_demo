import 'package:isar/isar.dart';
import 'package:isar_tod/src/data_access/isar/app_user_dto.dart';
import 'package:isar_tod/src/data_access/isar/app_user_repo_impl.dart';
import 'package:isar_tod/src/feature/user/app_user_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../feature/user/app_user_repo.dart';

part 'app_user_pod.g.dart';

@riverpod
Future<AppUserRepo> appUserRepo(AppUserRepoRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AppUserDTOSchema],
    directory: dir.path,
    inspector: true,
  );
  AppUserRepo repo = AppUserRepoImpl(dir, isar);
  return Future.value(repo);
}

@riverpod
Future<AppUserService> appUserService(AppUserServiceRef ref) async {
  var provider = ref.watch(appUserRepoProvider.future);
  AppUserRepo repo = await provider;
  return AppUserService(repo: repo);
}
