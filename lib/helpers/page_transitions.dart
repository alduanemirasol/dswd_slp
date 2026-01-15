import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType { slideLeft, slideRight, none }

CustomTransitionPage<T> buildPageWithTransition<T>({
  required GoRouterState state,
  required Widget child,
  PageTransitionType transition = PageTransitionType.slideLeft,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transition) {
        case PageTransitionType.slideRight:
          return _slideTransition(animation, child, const Offset(-1, 0));
        case PageTransitionType.slideLeft:
          return _slideTransition(animation, child, const Offset(1, 0));
        case PageTransitionType.none:
          return child;
      }
    },
  );
}

Widget _slideTransition(
  Animation<double> animation,
  Widget child,
  Offset beginOffset,
) {
  final tween = Tween(
    begin: beginOffset,
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.easeInOut));
  return SlideTransition(position: animation.drive(tween), child: child);
}
