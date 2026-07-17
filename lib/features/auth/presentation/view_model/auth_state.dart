import 'package:equatable/equatable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../domain/entities/user_entity.dart';

class AuthState extends Equatable {
  const AuthState({
    this.signInState = const BaseState<UserEntity>(),
    this.getCurrentUserState = const BaseState<UserEntity?>(),
    this.signOutState = const BaseState<void>(),
    this.isPasswordVisibale = true,
  });

  final BaseState<UserEntity> signInState;
  final BaseState<UserEntity?> getCurrentUserState;
  final BaseState<void> signOutState;
  final bool isPasswordVisibale;

  AuthState copyWith({
    BaseState<UserEntity>? signInState,
    BaseState<UserEntity?>? getCurrentUserState,
    BaseState<void>? signOutState,
    bool? isPasswordVisibale,
  }) {
    return AuthState(
      signInState: signInState ?? this.signInState,
      getCurrentUserState: getCurrentUserState ?? this.getCurrentUserState,
      signOutState: signOutState ?? this.signOutState,
      isPasswordVisibale: isPasswordVisibale ?? this.isPasswordVisibale,
    );
  }

  @override
  List<Object?> get props => [
    signInState,
    getCurrentUserState,
    signOutState,
    isPasswordVisibale,
  ];
}
