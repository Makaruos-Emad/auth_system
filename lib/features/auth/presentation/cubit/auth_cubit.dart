import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;
import '../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  StreamSubscription? _authSubscription;
  AuthCubit(this.repository) : super(const AuthState()) {
    _listenToAuthChanges();
    _syncAuthState();
  }

  void _listenToAuthChanges() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      _syncAuthState(user: data.session?.user);
    });
  }

  void _syncAuthState({User? user}) {
    final currentUser = user ?? Supabase.instance.client.auth.currentUser;

    if (currentUser != null) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: currentUser,
          errorMessage: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          clearUser: true,
          errorMessage: null,
        ),
      );
    }
  }

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

      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            user: currentUser,
            errorMessage: null,
          ),
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        _syncAuthState();
      }
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
      await Future.delayed(const Duration(milliseconds: 300));
      _syncAuthState();
    } on AuthException catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> signOut() async {
    emit(
      state.copyWith(
        status: AuthStatus.unauthenticated,
        clearUser: true,
        errorMessage: null,
      ),
    );

    try {
      await repository.signOut();
      await Future.delayed(const Duration(milliseconds: 300));
      _syncAuthState();
    } on AuthException catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
