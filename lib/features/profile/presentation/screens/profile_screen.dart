import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/core/services/service_locator.dart';
import 'package:auth_system/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:auth_system/features/profile/presentation/widget/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..loadProfile(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: ProfileScreenBody(),
          ),
        ),
      ),
    );
  }
}
