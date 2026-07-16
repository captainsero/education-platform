import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/data_sources/auth_remote_data_source_contract.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  final SupabaseClient supabaseClient;
  @override
  Stream<User?> authStateChanges() =>
      supabaseClient.auth.onAuthStateChange.map((event) => event.session?.user);

  @override
  Future<BaseResponse<User?>> getCurrentUser() async {
    try {
      return SuccessBaseResponse<User?>(data: supabaseClient.auth.currentUser);
    } catch (e) {
      return ErrorBaseResponse<User?>(error: AppError.from(e));
    }
  }

  @override
  Future<BaseResponse<User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        return const ErrorBaseResponse<User>(error: NotFoundError());
      }
      return SuccessBaseResponse<User>(data: user);
    } catch (e) {
      return ErrorBaseResponse<User>(error: AppError.from(e));
    }
  }

  @override
  Future<BaseResponse<void>> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return const SuccessBaseResponse<void>(data: null);
    } catch (e) {
      return ErrorBaseResponse<void>(error: AppError.from(e));
    }
  }
}
