import 'package:dswd_slp_new/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'Home'),
      body: const Center(child: Text("Home Page")),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
