// lib/app_router.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_template/domain/entities/user.dart';
import 'package:my_template/injection.dart';
import 'package:my_template/presentation/bloc/bloc/auth_bloc.dart';
import 'package:my_template/presentation/screens/home_screen.dart';
import 'package:my_template/presentation/screens/root_screen.dart';
import 'package:my_template/presentation/screens/sign_in_screen.dart';
import 'package:my_template/presentation/screens/some_screen.dart';

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
        if (kDebugMode) {
          print('state: $authState');
        }
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
          path: '/somepage',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const SomeScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
