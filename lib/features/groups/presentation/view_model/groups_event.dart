sealed class GroupsEvent {}

class GetGroupsEvent extends GroupsEvent {}

class SearchGroupsEvent extends GroupsEvent {
  SearchGroupsEvent({required this.query});

  final String query;
}
