import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("History Page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
