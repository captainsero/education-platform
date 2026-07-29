import '../../data/models/schedule_slot_input.dart';

sealed class GroupsEvent {}

class GetGroupsEvent extends GroupsEvent {}

class SearchGroupsEvent extends GroupsEvent {
  SearchGroupsEvent({required this.query});

  final String query;
}

class CreateGroupWithScheduleEvent extends GroupsEvent {
  CreateGroupWithScheduleEvent({required this.name, required this.slots});

  final String name;
  final List<ScheduleSlotInput> slots;
}

// ── Dialog form events ──────────────────────────────────────────────────

class ToggleDayEvent extends GroupsEvent {
  ToggleDayEvent({required this.dayIndex});

  final int dayIndex;
}

class UpdateDayStartTimeEvent extends GroupsEvent {
  UpdateDayStartTimeEvent({required this.dayIndex, required this.time});

  final int dayIndex;
  final String time; // "HH:mm"
}

class UpdateDayEndTimeEvent extends GroupsEvent {
  UpdateDayEndTimeEvent({required this.dayIndex, required this.time});

  final int dayIndex;
  final String time; // "HH:mm"
}

class ResetCreateGroupFormEvent extends GroupsEvent {}
