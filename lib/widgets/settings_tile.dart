import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? textColor;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? AppColors.textPrimary),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.textPrimary,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
