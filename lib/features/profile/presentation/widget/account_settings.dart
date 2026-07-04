import 'package:auth_system/core/theme/app_colors.dart';
import 'package:auth_system/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:auth_system/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:auth_system/features/profile/presentation/widget/border_container.dart';
import 'package:auth_system/features/profile/presentation/widget/row_item_settings.dart';
import 'package:auth_system/features/profile/presentation/widget/title_settings.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSettings(title: 'Account Settings'),
        const SizedBox(height: 10),
        BorderContainer(
          children: [
            RowItemSettings(
              title: 'Change Information',
              icon: Icons.person,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
            ),
            const Divider(color: AppColors.primaryColor),
            RowItemSettings(
              title: 'Change Password',
              icon: Icons.lock,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
