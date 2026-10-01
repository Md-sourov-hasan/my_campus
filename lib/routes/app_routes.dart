import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/screens/module_placeholder_screen.dart';
import 'package:task/features/splash/presentation/screens/splash_screen.dart';
import 'package:task/features/auth/presentation/screens/login_screen.dart';
import 'package:task/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:task/features/notices/presentation/screens/notices_screen.dart';
import 'package:task/features/notices/presentation/screens/notice_detail_screen.dart';
import 'package:task/features/attendance/presentation/screens/attendance_screen.dart';
import 'package:task/features/profile/presentation/screens/profile_screen.dart';
import 'package:task/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:task/features/results/presentation/screens/results_screen.dart';
import 'package:task/features/routine/presentation/screens/routine_screen.dart';
import 'package:task/features/assignments/presentation/screens/assignments_screen.dart';
import 'package:task/features/events/presentation/screens/events_screen.dart';
import 'package:task/features/library/presentation/screens/library_screen.dart';

/// Centralized route configuration using go_router.
class AppRoute {
  // ── Route Constants ───────────────────────────────────────────────
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String dashboardScreen = '/dashboard';
  static const String noticesScreen = '/notices';
  static const String noticeDetailScreen = '/notices/detail';
  static const String attendanceScreen = '/attendance';
  static const String profileScreen = '/profile';
  static const String notificationsScreen = '/notifications';

  // ── Quick Access Module Routes ────────────────────────────────────
  static const String resultsScreen = '/results';
  static const String routineScreen = '/routine';
  static const String assignmentsScreen = '/assignments';
  static const String eventsScreen = '/events';
  static const String libraryScreen = '/library';

  // ── Navigator Key ─────────────────────────────────────────────────
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // ── Router Configuration ──────────────────────────────────────────
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: splashScreen,
    errorBuilder: (context, state) => ModulePlaceholderScreen(
      title: 'Page Not Found',
      icon: Icons.error_outline_rounded,
      iconColor: Colors.redAccent,
      description: 'The requested route "${state.uri}" does not exist.',
    ),
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: dashboardScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const DashboardScreen(),
        ),
      ),
      GoRoute(
        path: noticesScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const NoticesScreen(),
        ),
      ),
      GoRoute(
        path: noticeDetailScreen,
        pageBuilder: (context, state) {
          final notice = state.extra as Map<String, dynamic>;
          return _buildPageWithTransition(
            context: context,
            state: state,
            child: NoticeDetailScreen(notice: notice),
          );
        },
      ),
      GoRoute(
        path: attendanceScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const AttendanceScreen(),
        ),
      ),
      GoRoute(
        path: profileScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const ProfileScreen(),
        ),
      ),
      GoRoute(
        path: notificationsScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const NotificationsScreen(),
        ),
      ),
      // ── Quick Access Routes ────────────────────────────────────────
      GoRoute(
        path: resultsScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const ResultsScreen(),
        ),
      ),
      GoRoute(
        path: routineScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const RoutineScreen(),
        ),
      ),
      GoRoute(
        path: assignmentsScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const AssignmentsScreen(),
        ),
      ),
      GoRoute(
        path: eventsScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const EventsScreen(),
        ),
      ),
      GoRoute(
        path: libraryScreen,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context: context,
          state: state,
          child: const LibraryScreen(),
        ),
      ),
    ],
  );

  // ── Custom Page Transition (Slide + Fade) ─────────────────────────
  static CustomTransitionPage _buildPageWithTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    bool slideUp = false,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin =
            slideUp ? const Offset(0.0, 1.0) : const Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        final fadeAnimation = animation.drive(
          Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve)),
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
