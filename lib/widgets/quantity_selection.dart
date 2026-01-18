import 'package:flutter/material.dart';
import 'quantity_selector.dart';

class QuantitySection extends StatelessWidget {
  const QuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        QuantitySelector(),
        SizedBox(height: 6),
        Text('Subtotal: ₱100', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
