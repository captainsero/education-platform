import 'package:equatable/equatable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../domain/entities/group_entity.dart';

class GroupsState extends Equatable {
  const GroupsState({
    this.getGroupsState = const BaseState<List<GroupEntity>>(),
    this.createGroupWithScheduleState = const BaseState<String>(),
    this.searchQuery = '',
  });

  final BaseState<List<GroupEntity>> getGroupsState;
  final BaseState<String> createGroupWithScheduleState;
  final String searchQuery;

  GroupsState copyWith({
    BaseState<List<GroupEntity>>? getGroupsState,
    BaseState<String>? createGroupWithScheduleState,
    String? searchQuery,
  }) => GroupsState(
    getGroupsState: getGroupsState ?? this.getGroupsState,
    createGroupWithScheduleState:
        createGroupWithScheduleState ?? this.createGroupWithScheduleState,
    searchQuery: searchQuery ?? this.searchQuery,
  );

  @override
  List<Object?> get props => [
    getGroupsState,
    createGroupWithScheduleState,
    searchQuery,
  ];
}
