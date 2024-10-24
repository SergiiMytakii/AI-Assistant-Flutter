// lib/app_router.dart
import 'dart:async';

import 'package:ai_assiatant_flutter/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/screens/home/home_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/root/root_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/settings/settings_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/signin/sign_in_screen.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/chat_screen.dart';

import 'dart:developer' as developer;

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GoRouter router = GoRouter(
  errorBuilder: (context, state) {
    logger.e('Error: ${state.error}');

    context.go('/');
    developer.log('Error: ${state.error}');
    return const SizedBox.shrink();
  },
  debugLogDiagnostics: true,
  redirect: (BuildContext context, GoRouterState state) {
    final authBloc = getIt<AuthenticationBloc>();

    developer.log('redirecting to ${state.uri}');

    print('Redirecting to ${state.uri}');
    if (kDebugMode) {
      print('Redirecting to ${state.uri}');
    }

    // Check if the URL contains a UUID
    final uri = state.uri.toString().substring(1);
    final uuidPattern = RegExp(r'([A-Za-z0-9]{28})');
    final match = uuidPattern.firstMatch(uri);
    if (match != null) {
      // Authenticate user by UUID
      authBloc.add(AuthenticateByUuid(uuid: uri));
    } else {
      authBloc.state.maybeWhen(
          initial: () => authBloc.add(const CheckAuthenticationStatus()),
          orElse: () {});
    }
    return null;
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
        final authState = context.watch<AuthenticationBloc>().state;
        print('Auth state: $authState');
        return authState.maybeWhen(
          authenticated: (User user) {
            if (user.isAdmin) {
              return NoTransitionPage<void>(
                  key: state.pageKey, child: RootScreen(child: child));
            } else {
              return NoTransitionPage<void>(
                  key: state.pageKey, child: const ChatScreen());
            }
          },
          unauthenticated: () => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SignInScreen(),
          ),
          orElse: () => const NoTransitionPage<void>(child: Scaffold()),
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
        GoRoute(
          path: '/:uuid',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final uuid = state.pathParameters['uuid'];
            logger.i('Used path with uuid: $uuid');
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const ChatScreen(),
            );
          },
        )
      ],
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
