import 'dart:io';
import '../datasource/auth_remote_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    File? image,
  }) {
    return remoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
      image: image,
    );
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    return remoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
}
