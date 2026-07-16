import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/base_response/base_response.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repo/auth_repo_contract.dart';
import '../data_sources/auth_remote_data_source_contract.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRepoImpl({required this.dataSourceContract});

  final AuthRemoteDataSourceContract dataSourceContract;
  @override
  Stream<UserEntity?> authStateChanges() =>
      dataSourceContract.authStateChanges().map(
        (user) =>
            user == null ? null : UserEntity(id: user.id, email: user.email),
      );

  @override
  Future<BaseResponse<UserEntity?>> getCurrentUser() async {
    final response = await dataSourceContract.getCurrentUser();
    switch (response) {
      case SuccessBaseResponse<User?>():
        final user = response.data;
        return SuccessBaseResponse<UserEntity?>(
          data: user == null
              ? null
              : UserEntity(id: user.id, email: user.email),
        );
      case ErrorBaseResponse<User?>():
        return ErrorBaseResponse<UserEntity?>(error: response.error);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await dataSourceContract.signIn(
      email: email,
      password: password,
    );
    switch (response) {
      case SuccessBaseResponse<User>():
        return SuccessBaseResponse<UserEntity>(
          data: UserEntity(id: response.data.id, email: response.data.email),
        );
      case ErrorBaseResponse<User>():
        return ErrorBaseResponse<UserEntity>(error: response.error);
    }
  }

  @override
  Future<BaseResponse<void>> signOut() {
    return dataSourceContract.signOut();
  }
}
