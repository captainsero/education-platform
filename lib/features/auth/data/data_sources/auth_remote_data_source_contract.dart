import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/base_response/base_response.dart';

abstract class AuthRemoteDataSourceContract {
  Future<BaseResponse<User>> signIn({
    required String email,
    required String password,
  });
  Future<BaseResponse<User?>> getCurrentUser();
  Future<BaseResponse<void>> signOut();
  Stream<User?> authStateChanges();
}
