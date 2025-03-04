import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      selectedItemColor: primaryPurple,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex, // Set the current index
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historial'),

        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),

        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Recordatorios',
        ),
      ],
      onTap: onTap, // Call the onTap function passed from the parent
    );
  }
}
