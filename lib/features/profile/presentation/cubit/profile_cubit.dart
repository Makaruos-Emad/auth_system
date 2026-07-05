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

  Future<void> updateProfile() async {
    if (state.profile == null) return;

    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      await repository.updateProfile(state.profile!);

      emit(state.copyWith(status: ProfileStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
