import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/settings/settings.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // Use const for the list of destinations to improve performance
      destinations: const [
        NavigationDestination(
            icon: Icon(Icons.calendar_today_sharp), label: 'Calendar'),
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
        }
      },
    );
  }
}
