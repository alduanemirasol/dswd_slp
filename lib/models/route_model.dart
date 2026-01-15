import 'package:flutter/material.dart';
import '../helpers/page_transitions.dart';

class AppRoute {
  final String path;
  final Widget page;
  final PageTransitionType transition;

  const AppRoute({
    required this.path,
    required this.page,
    this.transition = PageTransitionType.none,
  });
}
