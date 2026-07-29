import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/repo/groups_repo_contract.dart';
import '../data_sources/groups_remote_data_source_contract.dart';
import '../models/group_model.dart';
import '../models/schedule_slot_input.dart';

@Injectable(as: GroupsRepoContract)
class GroupsRepoImpl implements GroupsRepoContract {
  GroupsRepoImpl({required this.dataSourceContract});

  final GroupsRemoteDataSourceContract dataSourceContract;
  @override
  Future<BaseResponse<List<GroupEntity>>> getGroups() async {
    final response = await dataSourceContract.getGroups();
    switch (response) {
      case SuccessBaseResponse<List<GroupModel>>():
        return SuccessBaseResponse<List<GroupEntity>>(
          data: response.data.map((g) => g.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<GroupModel>>():
        return ErrorBaseResponse<List<GroupEntity>>(error: response.error);
    }
  }

  @override
  Future<BaseResponse<String>> createGroupWithSchedule({
    required String name,
    required List<ScheduleSlotInput> slots,
  }) async {
    final response = await dataSourceContract.createGroupWithSchedule(
      name: name,
      slots: slots,
    );
    return response;
  }
}
