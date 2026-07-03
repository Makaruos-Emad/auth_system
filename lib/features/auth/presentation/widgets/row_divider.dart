import 'package:flutter/material.dart';

class RowDivider extends StatelessWidget {
  final String text;

  const RowDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
      ],
    );
  }
}
