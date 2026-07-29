import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/values_manager.dart';
import '../view_model/groups_cubit.dart';
import '../view_model/groups_event.dart';
import '../view_model/groups_state.dart';
import '../widgets/create_group_dialog.dart';
import '../widgets/group_card.dart';
import '../widgets/group_error_widget.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My groups'),
        actions: [
          SizedBox(
            width: AppSize.s50,
            height: AppSize.s50,
            child: ElevatedButton(
              onPressed: () => CreateGroupDialog.show(context),
              child: const Icon(Icons.add_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            spacing: AppSize.s20,
            children: [
              SearchBar(
                hintText: 'Search groups...',
                leading: const Icon(Icons.search_outlined),
                onChanged: (query) async {
                  await context.read<GroupsCubit>().onEvent(
                    SearchGroupsEvent(query: query),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<GroupsCubit, GroupsState>(
                  buildWhen: (previous, current) =>
                      previous.getGroupsState != current.getGroupsState ||
                      previous.searchQuery != current.searchQuery,
                  builder: (context, state) {
                    final getGroupsState = state.getGroupsState;

                    // Loading state
                    if (getGroupsState.isLoading == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Error state
                    if (getGroupsState.errorMessage != null) {
                      return GroupErrorWidget(
                        errorMessage: getGroupsState.errorMessage!,
                      );
                    }

                    // Empty state (no data at all)
                    final allGroups = getGroupsState.data;
                    if (allGroups == null || allGroups.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: AppSize.s16,
                          children: [
                            Icon(
                              Icons.group_off_outlined,
                              size: AppSize.s60,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(100),
                            ),
                            Text(
                              'No groups yet',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      );
                    }

                    // Filtered results
                    final groups = context.read<GroupsCubit>().filteredGroups;

                    // No search results
                    if (groups.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: AppSize.s16,
                          children: [
                            Icon(
                              Icons.search_off_outlined,
                              size: AppSize.s60,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(100),
                            ),
                            Text(
                              'No groups match your search',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      );
                    }

                    // Success state – GridView
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSize.s16,
                            mainAxisSpacing: AppSize.s16,
                          ),
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        return GroupCard(group: groups[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
