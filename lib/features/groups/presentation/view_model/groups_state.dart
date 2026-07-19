import 'package:equatable/equatable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../domain/entities/group_entity.dart';

class GroupsState extends Equatable {
  const GroupsState({
    this.getGroupsState = const BaseState<List<GroupEntity>>(),
  });

  final BaseState<List<GroupEntity>> getGroupsState;

  GroupsState copyWith({BaseState<List<GroupEntity>>? getGroupsState}) =>
      GroupsState(getGroupsState: getGroupsState ?? this.getGroupsState);
  @override
  List<Object?> get props => [
    getGroupsState
  ];
}
