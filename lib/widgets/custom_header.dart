import 'package:flutter/material.dart';
import '../core/colors.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double elevation;

  const CustomHeader({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.primary,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
