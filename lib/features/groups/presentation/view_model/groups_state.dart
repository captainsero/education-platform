import 'package:equatable/equatable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../domain/entities/group_entity.dart';

/// Per-day schedule slot data for the create-group form.
class DaySlotState extends Equatable {
  const DaySlotState({
    this.isSelected = false,
    this.startTime = '16:00',
    this.endTime = '17:30',
  });

  final bool isSelected;
  final String startTime; // "HH:mm"
  final String endTime; // "HH:mm"

  DaySlotState copyWith({
    bool? isSelected,
    String? startTime,
    String? endTime,
  }) => DaySlotState(
    isSelected: isSelected ?? this.isSelected,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
  );

  @override
  List<Object?> get props => [isSelected, startTime, endTime];
}

class GroupsState extends Equatable {
  const GroupsState({
    this.getGroupsState = const BaseState<List<GroupEntity>>(),
    this.createGroupWithScheduleState = const BaseState<String>(),
    this.searchQuery = '',
    this.daySlots = const {
      0: DaySlotState(),
      1: DaySlotState(),
      2: DaySlotState(),
      3: DaySlotState(),
      4: DaySlotState(),
      5: DaySlotState(),
      6: DaySlotState(),
    },
  });

  final BaseState<List<GroupEntity>> getGroupsState;
  final BaseState<String> createGroupWithScheduleState;
  final String searchQuery;

  /// Day-index (0=Sun … 6=Sat) → slot state.
  final Map<int, DaySlotState> daySlots;

  bool get hasSelectedDays =>
      daySlots.values.any((slot) => slot.isSelected);

  GroupsState copyWith({
    BaseState<List<GroupEntity>>? getGroupsState,
    BaseState<String>? createGroupWithScheduleState,
    String? searchQuery,
    Map<int, DaySlotState>? daySlots,
  }) => GroupsState(
    getGroupsState: getGroupsState ?? this.getGroupsState,
    createGroupWithScheduleState:
        createGroupWithScheduleState ?? this.createGroupWithScheduleState,
    searchQuery: searchQuery ?? this.searchQuery,
    daySlots: daySlots ?? this.daySlots,
  );

  @override
  List<Object?> get props => [
    getGroupsState,
    createGroupWithScheduleState,
    searchQuery,
    daySlots,
  ];
}
