import 'package:auth_system/features/profile/presentation/widget/editable_profile_image.dart';
import 'package:auth_system/features/profile/presentation/widget/account_action.dart';
import 'package:auth_system/features/profile/presentation/widget/account_settings.dart';
import 'package:auth_system/features/profile/presentation/widget/app_settings.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          EditableProfileImage(imageUrl: null),
          const SizedBox(height: 20),
          Text("Name", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text("Email", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 30),
          const AccountSettings(),
          const SizedBox(height: 30),
          const AppSettings(),
          const SizedBox(height: 30),
          const AccountAction(),
        ],
      ),
    );
  }
}
