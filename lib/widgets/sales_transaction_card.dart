import 'package:flutter/material.dart';
import 'transaction_card.dart';

class SalesTransactionCard extends StatelessWidget {
  const SalesTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TransactionCard(
      type: 'Halin',
      amount: '+₱0.00',
      description: 'Product Name',
      date: DateTime.now(),
      amountColor: Colors.green,
    );
  }
}
