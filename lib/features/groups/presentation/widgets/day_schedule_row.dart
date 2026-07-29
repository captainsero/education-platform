import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../core/utils/time_picker_service.dart';
import '../../../../generated/l10n.dart';
import '../view_model/groups_cubit.dart';
import '../view_model/groups_event.dart';
import '../view_model/groups_state.dart';
import 'time_picker_tile.dart';

/// A single day row with a checkbox toggle and start / end time pickers.
class DayScheduleRow extends StatelessWidget {
  const DayScheduleRow({
    required this.dayIndex,
    required this.label,
    required this.slot,
    required this.isLast,
    super.key,
  });

  final int dayIndex;
  final String label;
  final DaySlotState slot;
  final bool isLast;

  Future<void> _onPickStart(BuildContext context) async {
    final time = await TimePickerService.pickTime(
      context,
      currentTime: slot.startTime,
    );
    if (time != null && context.mounted) {
      await context.read<GroupsCubit>().onEvent(
        UpdateDayStartTimeEvent(dayIndex: dayIndex, time: time),
      );
    }
  }

  Future<void> _onPickEnd(BuildContext context) async {
    final time = await TimePickerService.pickTime(
      context,
      currentTime: slot.endTime,
    );
    if (time != null && context.mounted) {
      await context.read<GroupsCubit>().onEvent(
        UpdateDayEndTimeEvent(dayIndex: dayIndex, time: time),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // Day toggle
        InkWell(
          borderRadius: BorderRadius.circular(RadiusSize.r12),
          onTap: () => context.read<GroupsCubit>().onEvent(
            ToggleDayEvent(dayIndex: dayIndex),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p10,
              horizontal: AppPadding.p4,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: slot.isSelected,
                  onChanged: (_) => context.read<GroupsCubit>().onEvent(
                    ToggleDayEvent(dayIndex: dayIndex),
                  ),
                ),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Text(
                    label,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: slot.isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Time pickers
        if (slot.isSelected)
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p40,
              bottom: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TimePickerTile(
                    label: S.current.start,
                    displayTime: TimePickerService.formatForDisplay(
                      context,
                      slot.startTime,
                    ),
                    onTap: () => _onPickStart(context),
                  ),
                ),
                const SizedBox(width: AppSize.s12),
                Expanded(
                  child: TimePickerTile(
                    label: S.current.end,
                    displayTime: TimePickerService.formatForDisplay(
                      context,
                      slot.endTime,
                    ),
                    onTap: () => _onPickEnd(context),
                  ),
                ),
              ],
            ),
          ),

        if (!isLast)
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withAlpha(80),
          ),
      ],
    );
  }
}
