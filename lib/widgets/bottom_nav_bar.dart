import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/colors.dart';

class NavItem {
  final IconData icon;
  final String label;
  final String path;

  const NavItem({required this.icon, required this.label, required this.path});
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNavBar({super.key, required this.currentIndex, this.onTap});

  // Only edit this list: icon, label, path
  static const navInput = [
    [Icons.home, 'Home', '/home'],
    [Icons.history, 'History', '/history'],
    [Icons.settings, 'Settings', '/settings'],
  ];

  List<NavItem> get navItems => navInput
      .map(
        (item) => NavItem(
          icon: item[0] as IconData,
          label: item[1] as String,
          path: item[2] as String,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final safeIndex = currentIndex.clamp(0, navItems.length - 1);

    return BottomNavigationBar(
      currentIndex: safeIndex,
      onTap: (index) {
        if (index == safeIndex) return;
        onTap?.call(index);
        context.go(navItems[index].path);
      },
      iconSize: 28,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey[600],
      items: navItems
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
