import 'package:flutter/material.dart';

import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bottom_navbar.dart';
import 'package:frontend/widgets/sidebar.dart';

// import 'package:frontend/screens/add_motorcycle_screen.dart';

import 'package:frontend/screens/home/modules/dashboard.dart';
import 'package:frontend/screens/home/modules/history.dart';
import 'package:frontend/screens/home/modules/reminders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 0 = History, 1 = Dashboard, 2 = Reminders
  int _currentIndex = 1;

  // List of screens for each tab
  final List<Widget> _screens = const [
    HistoryScreen(),
    DashboardScreen(),
    RemindersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer
      drawer: Sidebar(),

      // Appbar
      appBar: const CustomAppBar(title: 'MotoManager'),

      // Body
      body: IndexedStack(index: _currentIndex, children: _screens),

      // Bottom Nav Bar
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
