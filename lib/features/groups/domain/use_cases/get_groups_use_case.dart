import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entities/group_entity.dart';
import '../repo/groups_repo_contract.dart';

@injectable
class GetGroupsUseCase {
  GetGroupsUseCase({required this.repoContract});

  final GroupsRepoContract repoContract;

  Future<BaseResponse<List<GroupEntity>>> getGroups() =>
      repoContract.getGroups();
}
