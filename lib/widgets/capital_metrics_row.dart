import 'package:flutter/material.dart';
import 'metric_card.dart';

class CapitalMetricsRow extends StatelessWidget {
  final String cashOnHand;
  final String capital;

  const CapitalMetricsRow({
    super.key,
    required this.cashOnHand,
    required this.capital,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MetricCard(label: 'Cash on Hand', value: cashOnHand),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MetricCard(label: 'Capital', value: capital),
        ),
      ],
    );
  }
}
