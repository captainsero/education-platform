import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo_contract.dart';

@injectable
class GetCurrentUserUseCase {
  GetCurrentUserUseCase({required this.repoContract});

  final AuthRepoContract repoContract;

  Future<BaseResponse<UserEntity?>> call() => repoContract.getCurrentUser();
}
