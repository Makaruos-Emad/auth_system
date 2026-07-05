import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class StorageService {
  static final SupabaseClient _client = SupabaseService.client;

  static Future<String?> uploadProfileImage({
    required String userId,
    required File image,
  }) async {
    try {
      final extension = image.path.split('.').last;
      final path = '$userId/profile.$extension';

      await _client.storage
          .from('profiles')
          .upload(path, image, fileOptions: const FileOptions(upsert: true));

      final imageUrl = _client.storage.from('profiles').getPublicUrl(path);

      return imageUrl;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }
}
