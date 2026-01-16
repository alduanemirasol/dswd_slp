import 'package:flutter/material.dart';
import 'switch_button.dart';

class CashUtangSwitch extends StatelessWidget {
  const CashUtangSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCash = true;

    return Row(
      children: [
        SwitchButton(title: "Cash", active: isCash),
        const SizedBox(width: 10),
        SwitchButton(title: "Utang", active: !isCash),
      ],
    );
  }
}
