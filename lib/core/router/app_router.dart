import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../config/di/di.dart';
import '../../features/auth/presentation/view/auth_view.dart';
import '../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../features/dashboard/presentation/view/dashboard_view.dart';
import '../../features/error/view/error_view.dart';
import '../../features/groups/presentation/view/groups_view.dart';
import '../../features/main/main_view.dart';
import '../../features/scanner/presentation/view/scanner_view.dart';
import '../../features/schedule/presentation/view/schedule_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import 'route_path.dart';

abstract class AppRouter {
  static final GoRouter goRouter = GoRouter(
    initialLocation: RoutePath.loginRoute,
    routes: [
      GoRoute(
        path: RoutePath.loginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<AuthCubit>(),
          child: AuthView(),
        ),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.dashboardRoute,
                builder: (context, state) => const DashboardView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.groupsRoute,
                builder: (context, state) => const GroupsView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.scannerRoute,
                builder: (context, state) => const ScannerView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.scheduleRoute,
                builder: (context, state) => const ScheduleView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.settingsRoute,
                builder: (context, state) => const SettingsView(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(
        errorMessage: state.error?.toString() ?? 'Page not found',
      );
    },
  );
}
