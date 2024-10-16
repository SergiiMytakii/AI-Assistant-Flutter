// lib/app_router.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/screens/home_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/root_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/settings_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/sign_in_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/chat_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GoRouter router = GoRouter(
  errorBuilder: (context, state) {
    // Redirect to the home page  in case of any error
    context.go('/');
    return const SizedBox.shrink();
  },
  debugLogDiagnostics: true,
  redirect: (BuildContext context, GoRouterState state) {
    final authBloc = getIt<AuthenticationBloc>();
    if (kDebugMode) {
      print('Redirecting to ${state.uri}');
    }
    authBloc.state.maybeWhen(
        initial: () => authBloc.add(const CheckAuthenticationStatus()),
        orElse: () {});
    return null;
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
        final authState = context.watch<AuthenticationBloc>().state;
        return authState.maybeWhen(
          authenticated: (User user) {
            return NoTransitionPage<void>(
                key: state.pageKey, child: RootScreen(child: child));
          },
          orElse: () => NoTransitionPage<void>(
              key: state.pageKey, child: const SignInScreen()),
        );
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/chatscreen',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const ChatScreen(),
            );
          },
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const SettingsScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
