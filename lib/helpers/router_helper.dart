import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page_transitions_helper.dart';
import '../models/route_model.dart';
import '../routes.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: initialRoute,
    observers: [routeObserver],
    routes: appRoutes.map((AppRoute route) {
      return GoRoute(
        path: route.path,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: route.page,
          transition: route.transition,
        ),
      );
    }).toList(),
  );
}
