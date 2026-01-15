import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/navigation_item_model.dart';
import '../views/history_view.dart';
import '../views/home_view.dart';
import '../views/settings_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<NavigationItem> navigationItems = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      route: '/home',
      page: HomeView(),
    ),
    NavigationItem(
      icon: Icons.history,
      label: 'History',
      route: '/history',
      page: HistoryView(),
    ),
    NavigationItem(
      icon: Icons.settings,
      label: 'Settings',
      route: '/settings',
      page: SettingsView(),
    ),
  ];

  // Get current index from route
  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = navigationItems.indexWhere(
      (item) => location.startsWith(item.route),
    );
    return index < 0 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => context.go(navigationItems[index].route),
      items: navigationItems
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
