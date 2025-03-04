// lib/screens/dashboard/motorcycle_list_screen.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/motorcycle.dart';
import 'package:frontend/widgets/motorcycle_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  // Sample motorcycle data using the model
  List<Motorcycle> motorcycles = [
    Motorcycle(name: 'Yamaha R1', description: 'Mi moto'),
    Motorcycle(name: 'CBR 1000 RR', description: 'Moto de mi viejo'),
    Motorcycle(name: 'Kawazaki H2R', description: 'Moto de Mili 😍'),
    // Add more motorcycles as needed
  ];

  // Method to add a new motorcycle
  void addMotorcycle(Motorcycle motorcycle) {
    setState(() {
      motorcycles.add(motorcycle);
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final newMotorcycle = await Navigator.pushNamed(
                  context,
                  '/add_motorcycle',
                );
                if (newMotorcycle is Motorcycle) {
                  addMotorcycle(newMotorcycle);
                }
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, size: 24),
                      SizedBox(width: 8),
                      Text('Agregar una moto', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: motorcycles.length,
                itemBuilder: (context, index) {
                  return MotorcycleCard(
                    motorcycle: motorcycles[index],
                    primaryPurple: primaryPurple,
                    onEdit: () {
                      Navigator.pushNamed(
                        context,
                        '/edit_motorcycle',
                        arguments: motorcycles[index].toMap(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
