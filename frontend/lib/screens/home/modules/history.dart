// lib/screens/dashboard/reminders_screen.dart
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        // Center the content
        child: Text(
          'History Screen',
          style: TextStyle(
            color: Colors.white, // Set text color to white for better contrast
            fontSize: 24, // Increase font size
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
    );
  }
}
