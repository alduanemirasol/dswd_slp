import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../models/security_questions_model.dart';

class SecurityQuestionDropdown extends StatelessWidget {
  final String label;
  final List<SecurityQuestion> questions;
  final SecurityQuestion? selectedQuestion;
  final ValueChanged<SecurityQuestion?>? onChanged;
  final String hint;

  const SecurityQuestionDropdown({
    super.key,
    this.label = "Security Question",
    required this.questions,
    this.selectedQuestion,
    this.onChanged,
    this.hint = "Pili ug pangutana",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        DropdownButtonFormField<SecurityQuestion>(
          hint: Text(hint),
          initialValue: selectedQuestion,
          items: questions
              .map((q) => DropdownMenuItem(value: q, child: Text(q.text)))
              .toList(),
          onChanged: onChanged,
          dropdownColor: Colors.white,
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
