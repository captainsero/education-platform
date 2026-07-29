import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/group_entity.dart';
import 'group_container_icon_and_text.dart';
import 'group_schedule_container.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    required this.group,
    super.key,
  });

  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary.withAlpha(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        borderRadius: BorderRadius.circular(RadiusSize.r16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.s10,
        children: [
          Text(
            group.name,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
          GroupContainerIconAndText(
            title: '${group.studentCount} ${S.current.studnets}',
            icon: Icons.group_outlined,
          ),
          GroupContainerIconAndText(
            title: _formatScheduleDays(group),
            icon: Icons.date_range_outlined,
          ),
          if (group.schedules.isNotEmpty)
            GroupScheduleContainer(startTime: group.schedules.first.startTime),
        ],
      ),
    );
  }

  String _formatScheduleDays(GroupEntity group) {
    if (group.schedules.isEmpty) return S.current.noSchedule;

    const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final days = group.schedules.map((s) => dayNames[s.dayOfWeek]).toList();
    return days.join(' - ');
  }
}
