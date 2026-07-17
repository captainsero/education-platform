import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../../../config/handler/response_to_state_mapper.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/auth_state_changes_use_case.dart';
import '../../domain/use_cases/get_current_user_use_case.dart';
import '../../domain/use_cases/sign_in_use_case.dart';
import '../../domain/use_cases/sign_out_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthStateChangesUseCase authStateChangesUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _authStateChangesUseCase = authStateChangesUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       _signInUseCase = signInUseCase,
       _signOutUseCase = signOutUseCase,
       super(const AuthState()) {
    _authStateSubscription = _authStateChangesUseCase().listen(
      _onAuthStateChanged,
    );
  }
  final AuthStateChangesUseCase _authStateChangesUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  StreamSubscription<UserEntity?>? _authStateSubscription;

  void _onAuthStateChanged(UserEntity? user) {
    emit(
      state.copyWith(
        getCurrentUserState: BaseState(data: user),
      ),
    );
  }

  Future<void> onEvent(AuthEvent event) async {
    switch (event) {
      case GetCurrentUserEvent():
        await _getCurrentUser();
      case SignInEvent():
        await _signIn(email: event.email, password: event.password);
      case SignOutEvent():
        await _signOut();
      case TogglePasswordVisibilityEvent():
        _togglePasswordVisibility();
    }
  }

  Future<void> _getCurrentUser() async {
    emit(state.copyWith(getCurrentUserState: const BaseState(isLoading: true)));

    final response = await _getCurrentUserUseCase();
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(getCurrentUserState: handler));
  }

  Future<void> _signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signInState: const BaseState(isLoading: true)));

    final response = await _signInUseCase(email: email, password: password);
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(signInState: handler));
  }

  Future<void> _signOut() async {
    emit(state.copyWith(signOutState: const BaseState(isLoading: true)));

    final response = await _signOutUseCase();
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(signOutState: handler));
  }

  void _togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisibale: !state.isPasswordVisibale));
  }

  @override
  Future<void> close() async {
    await _authStateSubscription?.cancel();
    return super.close();
  }
}
