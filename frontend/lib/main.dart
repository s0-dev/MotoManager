import 'package:flutter/material.dart';

// ==== SCREENS ==== //

import 'screens/start/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/modules/functions/add_motorcycle_screen.dart';
import 'screens/home/modules/functions/edit_motorcycle_screen.dart';
import 'screens/home/user_profile_screen.dart';
import 'screens/home/settings_screen.dart';

// ==== SCREENS ==== //

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/add_motorcycle': (context) => const AddMotorcycleScreen(),
        '/edit_motorcycle': (context) => const EditMotorcycleScreen(),
        '/user_profile': (context) => const UserProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
