import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../data/models/schedule_slot_input.dart';
import '../repo/groups_repo_contract.dart';

@injectable
class CreateGroupWithScheduleUseCase {
  CreateGroupWithScheduleUseCase({required this.repoContract});

  final GroupsRepoContract repoContract;

  Future<BaseResponse<String>> call({
    required String name,
    required List<ScheduleSlotInput> slots,
  }) => repoContract.createGroupWithSchedule(name: name, slots: slots);
}
