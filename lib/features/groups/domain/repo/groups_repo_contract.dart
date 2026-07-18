import '../../../../config/base_response/base_response.dart';
import '../entities/group_entity.dart';
//
// ignore: one_member_abstracts
abstract class GroupsRepoContract {
  Future<BaseResponse<List<GroupEntity>>> getGroups();
}
