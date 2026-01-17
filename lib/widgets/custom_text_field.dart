import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.prefixText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    Widget? effectivePrefix;

    if (prefixIcon != null) {
      effectivePrefix = prefixIcon;
    } else if (prefixText != null) {
      effectivePrefix = SizedBox(
        width: 48,
        child: Center(
          child: Text(
            prefixText!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 60,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: effectivePrefix,
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
            borderSide: BorderSide(color: AppColors.primary, width: 1.2),
          ),
        ),
      ),
    );
  }
}
