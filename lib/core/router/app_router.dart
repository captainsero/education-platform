import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../config/di/di.dart';
import '../../features/auth/presentation/view/auth_view.dart';
import '../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../features/view/error_view.dart';
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
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(
        errorMessage: state.error?.toString() ?? 'Page not found',
      );
    },
  );
}
