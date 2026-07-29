import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/values_manager.dart';
import '../view_model/groups_cubit.dart';
import '../view_model/groups_event.dart';
import '../view_model/groups_state.dart';
import 'day_schedule_row.dart';

class CreateGroupDialog extends StatelessWidget {
  const CreateGroupDialog({
    required this.formKey,
    required this.nameController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;

  static const _dayLabels = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  /// Opens the dialog, resetting the form state beforehand.
  static Future<void> show(BuildContext context) {
    final cubit = context.read<GroupsCubit>();
    unawaited(cubit.onEvent(ResetCreateGroupFormEvent()));

    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: CreateGroupDialog(
          formKey: formKey,
          nameController: nameController,
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (!formKey.currentState!.validate()) return;

    final cubit = context.read<GroupsCubit>();

    if (!cubit.state.hasSelectedDays) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one day')),
      );
      return;
    }

    final slots = cubit.buildSlotsFromState();
    unawaited(
      cubit.onEvent(
        CreateGroupWithScheduleEvent(
          name: nameController.text.trim(),
          slots: slots,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<GroupsCubit, GroupsState>(
      listenWhen: (prev, curr) =>
          prev.createGroupWithScheduleState !=
          curr.createGroupWithScheduleState,
      listener: (context, state) {
        final createState = state.createGroupWithScheduleState;

        if (createState.data != null) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Group created successfully')),
          );
          unawaited(context.read<GroupsCubit>().onEvent(GetGroupsEvent()));
        }

        if (createState.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(createState.errorMessage!)),
          );
        }
      },
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusSize.r16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context, textTheme),
                const Divider(height: 1),
                _buildBody(context, textTheme, colorScheme),
                const Divider(height: 1),
                _buildActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppPadding.p20,
        AppPadding.p20,
        AppPadding.p8,
        AppPadding.p4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('Create New Group', style: textTheme.titleLarge),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  // ── Scrollable body ────────────────────────────────────────────────

  Widget _buildBody(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Flexible(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group name field
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Group name',
                hintText: 'e.g. Grade 10 – Physics',
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a group name';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSize.s24),

            // Schedule heading
            Text('Schedule', style: textTheme.titleMedium),
            const SizedBox(height: AppSize.s4),
            Text(
              'Select the days and set time for each',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(150),
              ),
            ),
            const SizedBox(height: AppSize.s12),

            // Day rows
            BlocBuilder<GroupsCubit, GroupsState>(
              buildWhen: (prev, curr) => prev.daySlots != curr.daySlots,
              builder: (context, state) {
                return Column(
                  children: List.generate(
                    _dayLabels.length,
                    (i) => DayScheduleRow(
                      dayIndex: i,
                      label: _dayLabels[i],
                      slot: state.daySlots[i] ?? const DaySlotState(),
                      isLast: i == _dayLabels.length - 1,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ── Footer actions ─────────────────────────────────────────────────

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: BlocBuilder<GroupsCubit, GroupsState>(
        buildWhen: (prev, curr) =>
            prev.createGroupWithScheduleState !=
            curr.createGroupWithScheduleState,
        builder: (context, state) {
          final isLoading =
              state.createGroupWithScheduleState.isLoading == true;

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: AppSize.s12,
            children: [
              TextButton(
                onPressed:
                    isLoading ? null : () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: isLoading ? null : () => _submit(context),
                child: isLoading
                    ? const SizedBox(
                        width: AppSize.s20,
                        height: AppSize.s20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }
}
