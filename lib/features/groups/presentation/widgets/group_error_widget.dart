import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';
import '../view_model/groups_cubit.dart';
import '../view_model/groups_event.dart';

class GroupErrorWidget extends StatelessWidget {
  const GroupErrorWidget({
    required this.errorMessage,
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSize.s16,
        children: [
          Icon(
            Icons.error_outline,
            size: AppSize.s60,
            color: Theme.of(context).colorScheme.error,
          ),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await context.read<GroupsCubit>().onEvent(
                GetGroupsEvent(),
              );
            },
            icon: const Icon(Icons.refresh),
            label: Text(S.current.retry),
          ),
        ],
      ),
    );
  }
}
