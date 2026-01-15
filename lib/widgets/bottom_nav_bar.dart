import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../views/home_view.dart';
import '../views/history_view.dart';
import '../views/settings_view.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final Widget page;

  NavigationItem({required this.icon, required this.label, required this.page});
}

class ReusableBottomNavBar extends StatefulWidget {
  const ReusableBottomNavBar({super.key});

  @override
  State<ReusableBottomNavBar> createState() => _ReusableBottomNavBarState();
}

class _ReusableBottomNavBarState extends State<ReusableBottomNavBar> {
  int _currentIndex = 0;

  final List<NavigationItem> _items = [
    NavigationItem(icon: Icons.home, label: "Home", page: const HomeView()),
    NavigationItem(
      icon: Icons.history,
      label: "History",
      page: const HistoryView(),
    ),
    NavigationItem(
      icon: Icons.settings,
      label: "Settings",
      page: const SettingsView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: _items
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

/*

Usage example:

MaterialApp(
  home: ReusableBottomNavBar(),
);

*/
