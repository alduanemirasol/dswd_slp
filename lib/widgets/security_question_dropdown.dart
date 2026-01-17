import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SecurityQuestionDropdown extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final String hint;

  const SecurityQuestionDropdown({
    required this.label,
    required this.items,
    this.onChanged,
    this.hint = "Pili ug pangutana",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          hint: Text(hint),
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
