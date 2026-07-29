import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/constants/app_keys/supabase_rpc.dart';
import '../../../../core/constants/app_keys/supabase_tables.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/data_sources/groups_remote_data_source_contract.dart';
import '../../data/models/group_model.dart';
import '../../data/models/schedule_slot_input.dart';

@Injectable(as: GroupsRemoteDataSourceContract)
class GroupsRemoteDataSourceImpl implements GroupsRemoteDataSourceContract {
  GroupsRemoteDataSourceImpl({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  @override
  Future<BaseResponse<List<GroupModel>>> getGroups() async {
    try {
      final data = await supabaseClient
          .from(SupabaseTables.groups)
          .select('*, schedules(*), students(count)')
          .eq('is_active', true)
          .order('name');

      return SuccessBaseResponse<List<GroupModel>>(
        data: (data as List)
            .map((row) => GroupModel.fromJson(row as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ErrorBaseResponse<List<GroupModel>>(error: AppError.from(e));
    }
  }

  @override
  Future<BaseResponse<String>> createGroupWithSchedule({
    required String name,
    required List<ScheduleSlotInput> slots,
  }) async {
    try {
      final response = await supabaseClient.rpc<String>(
        SupabaseRpc.createGroupWithSchedule,
        params: {
          'p_name': name,
          'p_slots': slots.map((s) => s.toJson()).toList(),
        },
      );
      return SuccessBaseResponse<String>(data: response);
    } catch (e) {
      return ErrorBaseResponse<String>(error: AppError.from(e));
    }
  }
}
