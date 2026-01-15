import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'helpers/page_transitions.dart';
import 'models/route_model.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';

// RouteObserver to track navigation
final routeObserver = RouteObserver<ModalRoute<void>>();

// Routes
const List<AppRoute> appRoutes = [
  AppRoute(path: '/login', page: LoginView()),
  AppRoute(
    path: '/register',
    page: RegisterView(),
    transition: PageTransitionType.slideLeft,
  ),
];

// GoRouter instance
GoRouter get router => GoRouter(
  initialLocation: '/login',
  observers: [routeObserver],
  routes: appRoutes
      .map(
        (route) => GoRoute(
          path: route.path,
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: route.page,
            transition: route.transition,
          ),
        ),
      )
      .toList(),
);
