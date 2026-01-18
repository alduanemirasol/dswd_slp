import 'package:flutter/material.dart';
import 'product_image.dart';
import 'product_info.dart';
import 'quantity_selection.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: const [
          ProductImage(),
          SizedBox(width: 12),
          Expanded(child: ProductInfo()),
          QuantitySection(),
        ],
      ),
    );
  }
}
