import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const CustomDatePicker({
    super.key,
    required this.label,
    required this.value,
    this.onTap = _defaultOnTap, // default empty function
  });

  static void _defaultOnTap() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: TextFormField(
          readOnly: true,
          onTap: onTap,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.calendar_today,
              color: AppColors.primary,
            ),
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.2,
              ),
            ),
          ),
          controller: TextEditingController(text: value),
        ),
      ),
    );
  }
}
