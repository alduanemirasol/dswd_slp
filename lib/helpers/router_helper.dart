import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page_transitions_helper.dart';
import '../models/route_model.dart';
import '../routes.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final Map<String, PageTransitionType Function(Object?)> transitionOverrides = {
  '/home': (extra) {
    if (extra == 'from_login') {
      return PageTransitionType.none;
    } else {
      return PageTransitionType.slideLeft;
    }
  },
};

GoRouter appRouter() {
  return GoRouter(
    initialLocation: initialRoute,
    observers: [routeObserver],
    routes: appRoutes.map(_buildGoRoute).toList(),
  );
}

GoRoute _buildGoRoute(AppRoute route) {
  return GoRoute(
    path: route.path,
    pageBuilder: (context, state) {
      final transition = _getRouteTransition(route, state.extra);

      return buildPageWithTransition(
        state: state,
        child: route.page,
        transition: transition,
      );
    },
  );
}

PageTransitionType _getRouteTransition(AppRoute route, Object? extra) {
  if (transitionOverrides.containsKey(route.path)) {
    return transitionOverrides[route.path]!(extra);
  }
  return route.transition;
}
