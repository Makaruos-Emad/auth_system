import 'package:auth_system/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_system/features/profile/presentation/widget/border_container.dart';
import 'package:auth_system/features/profile/presentation/widget/row_item_settings.dart';
import 'package:auth_system/features/profile/presentation/widget/title_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
            ),
          ],
        ),
      ],
    );
  }
}
