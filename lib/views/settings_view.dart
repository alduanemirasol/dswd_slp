import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/settings_profile_card.dart';
import '../widgets/settings_section_title.dart';
import '../widgets/settings_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: 'Settings'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SettingsProfileCard(),
            SizedBox(height: 20),
            SettingsSectionTitle(title: 'General Settings'),
            SettingsTile(title: 'Profile', icon: Icons.person),
            SizedBox(height: 8),
            SettingsTile(title: 'Change PIN', icon: Icons.lock),
            SizedBox(height: 20),
            SettingsSectionTitle(title: 'About'),
            SettingsTile(title: 'About App', icon: Icons.info),
            SizedBox(height: 8),
            SettingsTile(
              title: 'Logout',
              icon: Icons.logout,
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
