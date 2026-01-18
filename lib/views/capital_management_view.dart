import 'package:flutter/material.dart';
import '../widgets/balance_summary_card.dart';
import '../widgets/capital_metrics_row.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_field_item.dart';

class CapitalManagementView extends StatelessWidget {
  const CapitalManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Capital Management', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceSummaryCard(amount: '₱0.00'),
            SizedBox(height: 20),
            CapitalMetricsRow(cashOnHand: '₱0.00', capital: '₱0.00'),
            SizedBox(height: 20),
            FormFieldItem(label: 'Amount', hint: '₱ 0.00'),
            SizedBox(height: 20),
            FormFieldItem(label: 'Remarks', hint: 'Optional note'),
            SizedBox(height: 20),
            CustomButton(
              text: 'Add Capital',
              backgroundColor: Color(0xFF6200EE),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
