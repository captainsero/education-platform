import '../../../../config/base_response/base_response.dart';
import '../entities/user_entity.dart';

abstract class AuthRepoContract {
  Future<BaseResponse<UserEntity>> signIn({
    required String email,
    required String password,
  });
  Future<BaseResponse<UserEntity?>> getCurrentUser();
  Future<BaseResponse<void>> signOut();
  Stream<UserEntity?> authStateChanges();
}
