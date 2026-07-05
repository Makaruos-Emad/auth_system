import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import 'account_action.dart';
import 'account_settings.dart';
import 'app_settings.dart';
import 'profile_image.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.status == ProfileStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == ProfileStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Something went wrong'),
          );
        }
        final profile = state.profile;
        if (profile == null) {
          return const Center(child: Text('No profile found'));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              ProfileImage(imageUrl: profile.imageUrl),
              const SizedBox(height: 20),
              Text(
                profile.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                profile.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              const AccountSettings(),
              const SizedBox(height: 30),
              const AppSettings(),
              const SizedBox(height: 30),
              const AccountAction(),
            ],
          ),
        );
      },
    );
  }
}
