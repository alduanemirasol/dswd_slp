import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../helpers/box_shadows.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final String? route;

  const MenuCard({
    super.key,
    required this.title,
    required this.iconPath,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: route != null ? () => GoRouter.of(context).push(route!) : null,
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.defaultShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 48),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
