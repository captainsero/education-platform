import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';

/// A small tile displaying a label (e.g. "Start" / "End") and a formatted
/// time string. Tapping it triggers [onTap].
class TimePickerTile extends StatelessWidget {
  const TimePickerTile({
    required this.label,
    required this.displayTime,
    required this.onTap,
    super.key,
  });

  final String label;
  final String displayTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(RadiusSize.r8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outline.withAlpha(100)),
          borderRadius: BorderRadius.circular(RadiusSize.r8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              size: AppSize.s16,
              color: colorScheme.onSurface.withAlpha(150),
            ),
            const SizedBox(width: AppSize.s8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withAlpha(150),
                      ),
                ),
                Text(
                  displayTime,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
