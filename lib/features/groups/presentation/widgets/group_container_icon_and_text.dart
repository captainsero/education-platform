import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';

class GroupContainerIconAndText extends StatelessWidget {
  const GroupContainerIconAndText({
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
          size: AppSize.s16,
        ),
        Text(title, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
