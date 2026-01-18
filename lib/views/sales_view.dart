import 'package:dswd_slp_new/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/cash_credit_toggle.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/category_chip_list.dart';
import '../widgets/product_card.dart';
import '../widgets/sales_bottom_bar.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  bool isCash = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Halin', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CashCreditToggle(
                  isCash: isCash,
                  onCash: () => setState(() => isCash = true),
                  onUtang: () => setState(() => isCash = false),
                ),
                const SizedBox(height: 16),
                const ProductSearchBar(),
                const SizedBox(height: 12),
                const CategoryChipList(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: isCash ? _cashList() : _utangPlaceholder()),
          SalesBottomBar(isCash: isCash),
        ],
      ),
    );
  }

  Widget _cashList() => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    itemCount: 5,
    itemBuilder: (_, _) => const ProductCard(),
  );

  Widget _utangPlaceholder() => const Center(
    child: Text(
      'Utang flow UI goes here',
      style: TextStyle(fontSize: 16, color: Colors.black54),
    ),
  );
}
