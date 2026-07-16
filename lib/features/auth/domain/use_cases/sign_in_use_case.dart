import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo_contract.dart';

@injectable
class SignInUseCase {
  SignInUseCase({required this.repoContract});

  final AuthRepoContract repoContract;

  Future<BaseResponse<UserEntity>> call({
    required String email,
    required String password,
  }) => repoContract.signIn(email: email, password: password);
}
