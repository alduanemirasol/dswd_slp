import 'package:flutter/material.dart';
import 'cash_credit_toggle_button.dart';

class CashCreditToggle extends StatelessWidget {
  final bool isCash;
  final VoidCallback onCash;
  final VoidCallback onUtang;

  const CashCreditToggle({
    super.key,
    required this.isCash,
    required this.onCash,
    required this.onUtang,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CashCreditToggleButton(label: 'Cash', active: isCash, onTap: onCash),
        const SizedBox(width: 10),
        CashCreditToggleButton(label: 'Utang', active: !isCash, onTap: onUtang),
      ],
    );
  }
}
