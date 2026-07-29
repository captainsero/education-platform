import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../../../config/handler/response_to_state_mapper.dart';
import '../../data/models/schedule_slot_input.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/use_cases/create_group_with_schedule_use_case.dart';
import '../../domain/use_cases/get_groups_use_case.dart';
import 'groups_event.dart';
import 'groups_state.dart';

@injectable
class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit({
    required this.createGroupWithScheduleUseCase,
    required this.getGroupsUseCase,
  }) : super(const GroupsState());

  final GetGroupsUseCase getGroupsUseCase;
  final CreateGroupWithScheduleUseCase createGroupWithScheduleUseCase;

  List<GroupEntity> get filteredGroups {
    final groups = state.getGroupsState.data;
    if (groups == null) return [];

    final query = state.searchQuery.trim().toLowerCase();
    if (query.isEmpty) return groups;

    return groups
        .where((group) => group.name.toLowerCase().contains(query))
        .toList();
  }

  Future<void> onEvent(GroupsEvent event) async {
    switch (event) {
      case GetGroupsEvent():
        await _getGroups();
      case CreateGroupWithScheduleEvent():
        await _createGroupWithSchedule(name: event.name, slots: event.slots);
      case SearchGroupsEvent(:final query):
        _searchGroups(query);
      case ToggleDayEvent():
        _toggleDay(event.dayIndex);
      case UpdateDayStartTimeEvent():
        _updateDayStartTime(event.dayIndex, event.time);
      case UpdateDayEndTimeEvent():
        _updateDayEndTime(event.dayIndex, event.time);
      case ResetCreateGroupFormEvent():
        _resetForm();
    }
  }

  // ── Groups list ──────────────────────────────────────────────────────

  Future<void> _getGroups() async {
    emit(state.copyWith(getGroupsState: const BaseState(isLoading: true)));

    final response = await getGroupsUseCase();
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(getGroupsState: handler));
  }

  void _searchGroups(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  // ── Create group ─────────────────────────────────────────────────────

  Future<void> _createGroupWithSchedule({
    required String name,
    required List<ScheduleSlotInput> slots,
  }) async {
    emit(
      state.copyWith(
        createGroupWithScheduleState: const BaseState(isLoading: true),
      ),
    );

    final response = await createGroupWithScheduleUseCase(
      name: name,
      slots: slots,
    );
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(createGroupWithScheduleState: handler));
  }

  // ── Dialog form helpers ──────────────────────────────────────────────

  void _toggleDay(int dayIndex) {
    final current = state.daySlots[dayIndex] ?? const DaySlotState();
    final updated = Map<int, DaySlotState>.from(state.daySlots);
    updated[dayIndex] = current.copyWith(isSelected: !current.isSelected);
    emit(state.copyWith(daySlots: updated));
  }

  void _updateDayStartTime(int dayIndex, String time) {
    final current = state.daySlots[dayIndex] ?? const DaySlotState();
    final updated = Map<int, DaySlotState>.from(state.daySlots);
    updated[dayIndex] = current.copyWith(startTime: time);
    emit(state.copyWith(daySlots: updated));
  }

  void _updateDayEndTime(int dayIndex, String time) {
    final current = state.daySlots[dayIndex] ?? const DaySlotState();
    final updated = Map<int, DaySlotState>.from(state.daySlots);
    updated[dayIndex] = current.copyWith(endTime: time);
    emit(state.copyWith(daySlots: updated));
  }

  void _resetForm() {
    emit(state.copyWith(
      createGroupWithScheduleState: const BaseState<String>(),
      daySlots: const {
        0: DaySlotState(),
        1: DaySlotState(),
        2: DaySlotState(),
        3: DaySlotState(),
        4: DaySlotState(),
        5: DaySlotState(),
        6: DaySlotState(),
      },
    ));
  }

  /// Build [ScheduleSlotInput] list from the currently selected day slots.
  List<ScheduleSlotInput> buildSlotsFromState() {
    return state.daySlots.entries
        .where((e) => e.value.isSelected)
        .map(
          (e) => ScheduleSlotInput(
            dayOfWeek: e.key,
            startTime: e.value.startTime,
            endTime: e.value.endTime,
          ),
        )
        .toList();
  }
}
