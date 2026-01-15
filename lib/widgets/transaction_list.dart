import 'package:flutter/material.dart';
import 'default_transaction_card.dart';
import 'expense_transaction_card.dart';
import 'sales_transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (_, index) {
        if (index % 3 == 0) return const SalesTransactionCard();
        if (index % 3 == 1) return const ExpenseTransactionCard();
        return const DefaultTransactionCard();
      },
    );
  }
}
