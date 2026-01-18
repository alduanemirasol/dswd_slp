import 'package:flutter/material.dart';
import 'toggle_button.dart';

class ToggleButtonsWidget extends StatelessWidget {
  const ToggleButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: const [
            Expanded(child: ToggleButton(text: "Customer Utang", active: true)),
            Expanded(child: ToggleButton(text: "Owner Utang", active: false)),
          ],
        ),
      ),
    );
  }
}
