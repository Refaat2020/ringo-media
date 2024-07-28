import 'package:ringo_media/features/auth_feature/domain/cubit_controller/login_cubit.dart';
import 'package:ringo_media/features/auth_feature/views/login_screen/login_screen.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_cubit.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_day_cubit.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/choose_date_cubit.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/calendar_screen.dart';
import 'package:ringo_media/features/project_feature/domain/cubit/project_summary_cubit.dart';
import 'package:ringo_media/features/project_feature/views/main_screen/main_screen.dart';
import 'package:ringo_media/features/project_feature/views/project_screen/project_screen.dart';
import 'package:ringo_media/file_export.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorCategoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'categoryScreen');
final shellNavigatorProjectScreenKey =
    GlobalKey<NavigatorState>(debugLabel: 'projectScreen');
final shellNavigatorCalendarScreenKey =
    GlobalKey<NavigatorState>(debugLabel: ' calendarScreen');
final shellNavigatorMemojiScreenKey =
    GlobalKey<NavigatorState>(debugLabel: ' memojiScreen');

class AppRouter {
  static final route = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: LoginScreen.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell),
        branches: [
          // The route branch for the 1º Tab
          StatefulShellBranch(
            navigatorKey: shellNavigatorMemojiScreenKey,
            // Add this branch routes
            // each routes with its sub routes if available e.g feed/uuid/details
            routes: <RouteBase>[
              GoRoute(
                name: "/memojiScreen",
                path: "/memojiScreen",
                builder: (context, state) => Container(
                  color: AppColors.additionalGreen,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCategoryKey,
            // Add this branch routes
            // each routes with its sub routes if available e.g feed/uuid/details
            routes: <RouteBase>[
              GoRoute(
                name: CalendarScreen.routeName,
                path: CalendarScreen.routeName,
                builder: (context, state) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (BuildContext context) => CalendarCubit(),
                  ),
                  BlocProvider(
                    create: (BuildContext context) => CalendarDayCubit(),
                  ),
                  BlocProvider(
                    create: (BuildContext context) => ChooseDateCubit(),
                  ),
                ], child: const CalendarScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCalendarScreenKey,
            // Add this branch routes
            // each routes with its sub routes if available e.g feed/uuid/details
            routes: <RouteBase>[
              GoRoute(
                name: "/s",
                path: "/s",
                builder: (context, state) => Container(
                  color: AppColors.additionalPurple,
                ),
              ),
            ],
          ),
          // The route branch for 2º Tab
          StatefulShellBranch(
            navigatorKey: shellNavigatorProjectScreenKey,
            // Add this branch routes
            // each routes with its sub routes if available e.g feed/uuid/details
            routes: <RouteBase>[
              GoRoute(
                name: ProjectScreen.routeName,
                path: ProjectScreen.routeName,
                builder: (context, state) => BlocProvider(
                    create: (context) => ProjectSummaryCubit(),
                    child: const ProjectScreen()),
              ),
            ],
          ),
          // The route branch for 3 Tab
        ],
      ),
    ],
  );
}
