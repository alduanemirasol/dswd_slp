import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../helpers/box_shadows.dart';
import '../helpers/date_helper.dart';

class DatePicker extends StatelessWidget {
  final String title;
  const DatePicker({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.defaultShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                ),
              ),
              const Icon(Icons.calendar_today, size: 17),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            DateHelper.format(DateTime.now()),
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
