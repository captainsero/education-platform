import '../../../../config/base_response/base_response.dart';
import '../../data/models/schedule_slot_input.dart';
import '../entities/group_entity.dart';

abstract class GroupsRepoContract {
  Future<BaseResponse<List<GroupEntity>>> getGroups();
  Future<BaseResponse<String>> createGroupWithSchedule({
    required String name,
    required List<ScheduleSlotInput> slots,
  });
}
