import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repo/auth_repo_contract.dart';

@injectable
class AuthStateChangesUseCase {
  AuthStateChangesUseCase({required this.repoContract});

  final AuthRepoContract repoContract;

  Stream<UserEntity?> call() => repoContract.authStateChanges();
}
