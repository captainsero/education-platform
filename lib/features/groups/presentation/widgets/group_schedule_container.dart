import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../core/utils/date_time_utils.dart';

class GroupScheduleContainer extends StatelessWidget {
  const GroupScheduleContainer({
    required this.startTime,
    super.key,
  });

  final String startTime;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(RadiusSize.r16),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: AppSize.s1_5,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary.withAlpha(100),
                blurRadius: RadiusSize.r5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              DateTimeUtils.formatTime12Hour(startTime),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
