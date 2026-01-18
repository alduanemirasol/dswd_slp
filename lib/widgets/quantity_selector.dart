import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        children: [
          Icon(Icons.remove, size: 18),
          SizedBox(width: 30, child: Center(child: Text('1'))),
          Icon(Icons.add, size: 18),
        ],
      ),
    );
  }
}
