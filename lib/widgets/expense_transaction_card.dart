import 'package:flutter/material.dart';
import 'transaction_card.dart';

class ExpenseTransactionCard extends StatelessWidget {
  const ExpenseTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TransactionCard(
      type: 'Gasto',
      amount: '-₱0.00',
      description: 'Category Name',
      date: DateTime.now(),
      amountColor: Colors.red,
    );
  }
}
