import 'package:auth_system/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:auth_system/features/profile/data/model/profile_model.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileModel> getProfile() {
    return remoteDataSource.getProfile();
  }

  @override
  Future<void> updateProfile(ProfileModel profile) {
    return remoteDataSource.updateProfile(profile);
  }
}
