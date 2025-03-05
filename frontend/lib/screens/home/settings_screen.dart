import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Section Header: Account Settings
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Ajustes de cuenta',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock, color: primaryPurple),
              title: const Text(
                'Cambiar contraseña',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Implement change password functionality or navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: primaryPurple),
              title: const Text(
                'Cambiar email',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Implement update email functionality or navigation
              },
            ),
            const Divider(color: Colors.white24),
            // Section Header: Notifications
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Notificaciones',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              activeColor: primaryPurple,
              title: const Text(
                'Activar notificaciones',
                style: TextStyle(color: Colors.white),
              ),
              value: true,
              onChanged: (bool value) {
                // Handle notification toggle
              },
            ),
            // Add more settings options as needed
          ],
        ),
      ),
    );
  }
}
