import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/core/services/service_locator.dart';
import 'package:auth_system/features/profile/data/model/profile_model.dart';
import 'package:auth_system/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:auth_system/features/profile/presentation/widget/edit_profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.profile});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..loadProfile(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: EditProfileScreenBody(profile: profile),
          ),
        ),
      ),
    );
  }
}
