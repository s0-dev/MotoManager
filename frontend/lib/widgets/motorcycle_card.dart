// lib/widgets/motorcycle_card.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/motorcycle.dart';

class MotorcycleCard extends StatelessWidget {
  final Motorcycle motorcycle;
  final Color primaryPurple;
  final VoidCallback onEdit;

  const MotorcycleCard({
    super.key,
    required this.motorcycle,
    required this.primaryPurple,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        leading: Icon(Icons.assignment_rounded, color: primaryPurple, size: 32),

        title: Text(
          motorcycle.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        subtitle: Text(
          motorcycle.description,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),

        trailing: IconButton(
          icon: Icon(Icons.edit, color: primaryPurple),
          onPressed: onEdit,
        ),
      ),
    );
  }
}
