import 'package:auth_system/core/theme/app_colors.dart';
import 'package:auth_system/features/profile/presentation/widget/border_container.dart';
import 'package:auth_system/features/profile/presentation/widget/row_item_settings.dart';
import 'package:auth_system/features/profile/presentation/widget/title_settings.dart';
import 'package:flutter/material.dart';

class AccountAction extends StatelessWidget {
  const AccountAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSettings(title: 'Account Actions'),
        const SizedBox(height: 10),
        BorderContainer(
          children: [
            RowItemSettings(
              title: 'logout',
              icon: Icons.logout,
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
            const Divider(color: AppColors.primaryColor),
            RowItemSettings(
              title: 'Delete Account',
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
