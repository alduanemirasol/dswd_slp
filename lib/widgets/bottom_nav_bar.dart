import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/navigation_item_model.dart';
import '../core/colors.dart';

// Navigation items
const List<NavigationItem> navItems = [
  NavigationItem(icon: Icons.home, label: 'Home', route: '/home'),
  NavigationItem(icon: Icons.history, label: 'History', route: '/history'),
  NavigationItem(icon: Icons.settings, label: 'Settings', route: '/settings'),
];

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = _resolveCurrentIndex(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => context.go(navItems[index].route),
      items: _buildNavItems(),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
    );
  }
}

// Get current index from route
int _resolveCurrentIndex(BuildContext context) {
  final location = GoRouterState.of(context).uri.path;
  final index = navItems.indexWhere((item) => location.startsWith(item.route));
  return index == -1 ? 0 : index;
}

// Build bottom navigation bar items
List<BottomNavigationBarItem> _buildNavItems() {
  return navItems
      .map(
        (item) =>
            BottomNavigationBarItem(icon: Icon(item.icon), label: item.label),
      )
      .toList();
}
