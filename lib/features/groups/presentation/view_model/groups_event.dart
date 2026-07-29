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
