import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/base_state/base_state.dart';
import '../../../../config/handler/response_to_state_mapper.dart';
import '../../domain/use_cases/get_groups_use_case.dart';
import 'groups_event.dart';
import 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit({required this.getGroupsUseCase}) : super(const GroupsState());

  final GetGroupsUseCase getGroupsUseCase;

  Future<void> onEvent(GroupsEvent event) async {
    switch (event) {
      case GetGroupsEvent():
        await _getGroups();
    }
  }

  Future<void> _getGroups() async {
    emit(state.copyWith(getGroupsState: const BaseState(isLoading: true)));

    final response = await getGroupsUseCase();
    final handler = ResponseToStateMapper.handle(response);

    emit(state.copyWith(getGroupsState: handler));
  }
}
