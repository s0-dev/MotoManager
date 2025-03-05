import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define colors consistent with your design
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage(
                  'lib/assets/images/Logo-base.png',
                ), // Update asset path
                backgroundColor: primaryPurple,
              ),
              const SizedBox(height: 16),
              // User Name
              const Text(
                'Lautaro Devoto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // User Email
              const Text(
                'tu@email.com',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Additional user info (phone, location)
              ListTile(
                leading: Icon(Icons.phone, color: primaryPurple),
                title: const Text(
                  'Teléfono',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: primaryPurple),
                title: const Text(
                  'Localización',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
