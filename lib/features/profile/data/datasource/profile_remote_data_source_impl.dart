import 'package:auth_system/core/services/supabase_service.dart';
import 'package:auth_system/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_remote_data_source.dart';

bool _isSupabaseRlsError(Object error) {
  if (error is! PostgrestException) {
    return false;
  }

  final text = [
    error.message,
    error.details,
    error.hint,
  ].join(' ').toLowerCase();

  return error.code == '42501' ||
      error.code == '403' ||
      text.contains('row-level security') ||
      text.contains('security policy') ||
      text.contains('forbidden');
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient client = SupabaseService.client;

  @override
  Future<ProfileModel> getProfile() async {
    final user = client.auth.currentUser;

    if (user == null) {
      throw Exception('User not found');
    }

    final response = await client
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    if (response == null) {
      final fallbackName =
          user.userMetadata?['name']?.toString() ??
          user.email?.split('@').first ??
          'User';

      try {
        final insertedProfile = await client
            .from('profiles')
            .upsert({
              'id': user.id,
              'name': fallbackName,
              'email': user.email,
              'image_url': user.userMetadata?['avatar_url'],
            }, onConflict: 'id')
            .select()
            .maybeSingle();

        if (insertedProfile != null) {
          return ProfileModel.fromJson(
            Map<String, dynamic>.from(insertedProfile),
          );
        }
      } catch (error) {
        if (!_isSupabaseRlsError(error)) {
          rethrow;
        }
      }

      return ProfileModel(
        id: user.id,
        name: fallbackName,
        email: user.email ?? '',
        imageUrl: user.userMetadata?['avatar_url']?.toString(),
      );
    }

    return ProfileModel.fromJson(Map<String, dynamic>.from(response));
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    try {
      await client.from('profiles').upsert(profile.toJson(), onConflict: 'id');
    } catch (error) {
      if (!_isSupabaseRlsError(error)) {
        rethrow;
      }
    }
  }
}
