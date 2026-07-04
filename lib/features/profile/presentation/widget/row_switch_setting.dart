import 'package:auth_system/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RowSwitchSetting extends StatelessWidget {
  const RowSwitchSetting({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
    this.backgroundColor = AppColors.primaryColor,
  });

  final String title;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
