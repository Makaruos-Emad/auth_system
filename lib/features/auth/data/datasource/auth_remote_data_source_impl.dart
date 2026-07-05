import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/services/supabase_error_utils.dart';
import '../../../../core/services/supabase_service.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client = SupabaseService.client;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    File? image,
  }) async {
    final response = await client.auth.signUp(email: email, password: password);

    final user = response.user;
    if (user == null) {
      throw Exception('User creation failed');
    }
    String? imageUrl;
    if (image != null) {
      imageUrl = await StorageService.uploadProfileImage(
        userId: user.id,
        image: image,
      );
    }

    try {
      await client.from('profiles').insert({
        'id': user.id,
        'name': name,
        'email': email,
        'image_url': imageUrl,
      });
    } catch (error) {
      if (!isSupabaseRlsError(error)) {
        rethrow;
      }
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await client.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
