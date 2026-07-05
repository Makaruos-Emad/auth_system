import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;
import '../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(const AuthState());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    File? image,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await repository.signUp(
        name: name,
        email: email,
        password: password,
        image: image,
      );

      emit(
        state.copyWith(status: AuthStatus.authenticated, errorMessage: null),
      );
    } on AuthException catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await repository.signIn(email: email, password: password);

      emit(
        state.copyWith(status: AuthStatus.authenticated, errorMessage: null),
      );
    } on AuthException catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await repository.signOut();

      emit(
        state.copyWith(status: AuthStatus.unauthenticated, errorMessage: null),
      );
    } on AuthException catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }
}
