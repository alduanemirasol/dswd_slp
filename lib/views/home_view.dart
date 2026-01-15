import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home Page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
