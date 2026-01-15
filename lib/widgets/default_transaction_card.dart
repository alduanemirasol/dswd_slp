import 'package:flutter/material.dart';
import 'transaction_card.dart';

class DefaultTransactionCard extends StatelessWidget {
  const DefaultTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TransactionCard(
      type: 'Other',
      amount: '+₱0.00',
      description: 'Description',
      date: DateTime.now(),
      amountColor: Colors.green,
    );
  }
}
