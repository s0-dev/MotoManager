import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color(0xFF9C88FF);
    const Color backgroundColor = Color(0xFF1C1B2E);

    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero, // Ensure no extra padding.
          children: [
            // Drawer header
            DrawerHeader(
              decoration: BoxDecoration(color: primaryPurple),
              child: const Text(
                'Sidebar',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              // User Profile tile
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Closes the drawer
                Navigator.pop(context);
                // Navigate to the the user profile
                Navigator.pushNamed(context, '/user_profile');
              },
            ),

            ListTile(
              // Settings tile
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Closes the drawer
                Navigator.pop(context);
                // Navigate to the settings screen
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
