import 'dart:io';

abstract class AuthRepository {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    File? image,
  });

  Future<void> signIn({required String email, required String password});

  Future<void> resetPassword({required String email});

  Future<void> signOut();
}
