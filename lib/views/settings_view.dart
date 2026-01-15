import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Settings Page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
