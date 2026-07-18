import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/data_sources/groups_remote_data_source_contract.dart';
import '../../data/models/group_model.dart';

@Injectable(as: GroupsRemoteDataSourceContract)
class GroupsRemoteDataSourceImpl implements GroupsRemoteDataSourceContract {
  GroupsRemoteDataSourceImpl({required this.supabaseClient});

  final SupabaseClient supabaseClient;
  static const _table = 'groups';

  @override
  Future<BaseResponse<List<GroupModel>>> getGroups() async {
    try {
      final data = await supabaseClient
          .from(_table)
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
}
