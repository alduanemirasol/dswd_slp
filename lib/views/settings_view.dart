import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: 'Settings'),
      body: SafeArea(child: Center(child: Text("Settings Page"))),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
