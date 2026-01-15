import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/history_view_model.dart';
import '../widgets/category_chips.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_header.dart';
import '../widgets/date_picker.dart';
import '../widgets/transaction_list.dart';
import '../providers/global_providers.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GlobalProviders.historyViewModel,
      child: Scaffold(
        appBar: const CustomHeader(title: 'History'),
        backgroundColor: Colors.white,
        body: Consumer<HistoryViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Date pickers
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(child: DatePicker(title: 'Start Date')),
                      SizedBox(width: 12),
                      Expanded(child: DatePicker(title: 'End Date')),
                    ],
                  ),
                ),

                // Dynamic category chips
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CategoryChipsWithDots(
                    categories: vm.categories,
                    selectedCategory: vm.selectedCategory ?? '',
                    onCategorySelected: vm.selectCategory,
                  ),
                ),

                // Placeholder for transaction list
                const Expanded(child: TransactionList()),
              ],
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
