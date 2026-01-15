import 'package:flutter/material.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final String route;
  final Widget page;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.page,
  });
}
