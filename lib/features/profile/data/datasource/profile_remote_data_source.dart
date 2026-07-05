import 'package:auth_system/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<void> updateProfile(ProfileModel profile);
}
