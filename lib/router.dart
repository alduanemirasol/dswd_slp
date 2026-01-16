import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'helpers/page_transitions.dart';
import 'models/route_model.dart';
import 'views/expense_view.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/home_view.dart';
import 'views/history_view.dart';
import 'views/settings_view.dart';
import 'views/stock_in_view.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();

const List<AppRoute> appRoutes = [
  AppRoute(path: '/login', page: LoginView()),
  AppRoute(
    path: '/register',
    page: RegisterView(),
    transition: PageTransitionType.slideLeft,
  ),
  AppRoute(
    path: '/home',
    page: HomeView(),
    transition: PageTransitionType.none,
  ),
  AppRoute(
    path: '/history',
    page: HistoryView(),
    transition: PageTransitionType.none,
  ),
  AppRoute(
    path: '/settings',
    page: SettingsView(),
    transition: PageTransitionType.none,
  ),
  AppRoute(
    path: '/expenses',
    page: ExpenseView(),
    transition: PageTransitionType.slideLeft,
  ),
  AppRoute(
    path: '/stock_in',
    page: StockInView(),
    transition: PageTransitionType.slideLeft,
  ),
];

GoRouter get router => GoRouter(
  initialLocation: '/home', // Initial route
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
