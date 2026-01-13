import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'helpers/page_transitions.dart';
import 'views/login_view.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();
final router = GoRouter(
  initialLocation: '/login',
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        final fromLogout = state.extra == 'fromLogout';
        return customPage(
          state,
          const LoginView(),
          transition: fromLogout
              ? PageTransitionType.back
              : PageTransitionType.forward,
        );
      },
    ),
  ],
);
