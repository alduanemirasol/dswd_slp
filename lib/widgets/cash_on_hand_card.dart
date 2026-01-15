import 'package:flutter/material.dart';
import '../core/colors.dart';

class CashSummaryCard extends StatelessWidget {
  final String cash;
  final String mobileNumber;

  const CashSummaryCard({
    super.key,
    required this.cash,
    required this.mobileNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cash on Hand',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 219, 219, 219),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cash,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mobile Number: $mobileNumber',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 219, 219, 219),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
