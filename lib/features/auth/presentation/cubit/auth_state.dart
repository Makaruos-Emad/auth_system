import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;
  final bool passwordResetSent;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
    this.passwordResetSent = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
    bool clearUser = false,
    bool? passwordResetSent,
    bool clearPasswordResetSent = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: clearUser ? null : user ?? this.user,
      errorMessage: errorMessage,
      passwordResetSent: clearPasswordResetSent
          ? false
          : passwordResetSent ?? this.passwordResetSent,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage, passwordResetSent];
}
