import '../../../../config/base_response/base_response.dart';
import '../models/group_model.dart';

//
// ignore: one_member_abstracts
abstract class GroupsRemoteDataSourceContract {
  Future<BaseResponse<List<GroupModel>>> getGroups();
}
