import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_state/base_state.dart';
import '../../../../config/handler/response_to_state_mapper.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/use_cases/get_groups_use_case.dart';
import 'groups_event.dart';
import 'groups_state.dart';

@injectable
class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit({required this.getGroupsUseCase}) : super(const GroupsState());

  final GetGroupsUseCase getGroupsUseCase;

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
      case SearchGroupsEvent(:final query):
        _searchGroups(query);
    }
  }

  Future<void> _getGroups() async {
    emit(state.copyWith(getGroupsState: const BaseState(isLoading: true)));

    final response = await getGroupsUseCase();
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(getGroupsState: handler));
  }

  void _searchGroups(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
