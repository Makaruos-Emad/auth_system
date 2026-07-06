import 'package:auth_system/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(const ProfileState());

  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      final profile = await repository.getProfile();

      emit(
        state.copyWith(
          status: ProfileStatus.loaded,
          profile: profile,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> updateProfile({String? name, String? imageUrl}) async {
    if (state.profile == null) return;

    final updatedProfile = state.profile!.copyWith(
      name: name ?? state.profile!.name,
      imageUrl: imageUrl ?? state.profile!.imageUrl,
    );

    emit(
      state.copyWith(status: ProfileStatus.loading, profile: updatedProfile),
    );

    try {
      await repository.updateProfile(updatedProfile);

      emit(
        state.copyWith(status: ProfileStatus.loaded, profile: updatedProfile),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
