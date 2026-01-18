import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Price: ₱100'),
        Text('Stock: 20'),
      ],
    );
  }
}
