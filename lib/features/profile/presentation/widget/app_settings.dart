import 'package:auth_system/features/profile/presentation/widget/border_container.dart';
import 'package:auth_system/features/profile/presentation/widget/row_switch_setting.dart';
import 'package:auth_system/features/profile/presentation/widget/title_settings.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSettings(title: 'App Settings'),
        const SizedBox(height: 10),
        BorderContainer(
          children: [
            RowSwitchSetting(
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ],
    );
  }
}
