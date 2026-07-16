import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../repo/auth_repo_contract.dart';

@injectable
class SignOutUseCase {
  SignOutUseCase({required this.repoContract});

  final AuthRepoContract repoContract;

  Future<BaseResponse<void>> call() => repoContract.signOut();
}
