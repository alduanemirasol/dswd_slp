import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Home Page", style: TextStyle(fontSize: 18)),
      ),

      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
