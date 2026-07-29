import '../../../../config/base_response/base_response.dart';
import '../models/group_model.dart';
import '../models/schedule_slot_input.dart';
abstract class GroupsRemoteDataSourceContract {
  Future<BaseResponse<List<GroupModel>>> getGroups();
  Future<BaseResponse<String>> createGroupWithSchedule({
    required String name,
    required List<ScheduleSlotInput> slots,
  });
}
