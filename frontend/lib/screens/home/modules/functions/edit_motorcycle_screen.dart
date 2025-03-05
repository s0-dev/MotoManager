import 'package:flutter/material.dart';

class EditMotorcycleScreen extends StatefulWidget {
  const EditMotorcycleScreen({super.key});

  @override
  State<EditMotorcycleScreen> createState() => _EditMotorcycleScreenState();
}

class _EditMotorcycleScreenState extends State<EditMotorcycleScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  // This variable will hold the motorcycle data passed via Navigator
  late Map<String, String> motorcycleData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve arguments from the previous screen.
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && args is Map<String, String>) {
      motorcycleData = args;
    } else {
      motorcycleData = {'name': '', 'description': ''};
    }
    // Initialize controllers with existing data
    _nameController = TextEditingController(text: motorcycleData['name']);
    _descriptionController = TextEditingController(
      text: motorcycleData['description'],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateMotorcycle() {
    if (_formKey.currentState!.validate()) {
      final updatedName = _nameController.text;
      final updatedDescription = _descriptionController.text;

      // Here, you would typically send the updated data to your backend
      // or update the local state accordingly.
      // For this example, we simply print the new values.
      // print('Updated Motorcycle: $updatedName, $updatedDescription');

      // Show a confirmation message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Motorcycle updated successfully!')),
      );

      // Optionally, navigate back to the previous screen.
      Navigator.pop(context, {
        'name': updatedName,
        'description': updatedDescription,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Motorcycle',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Motorcycle Name Field
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Edita el nombre de la moto',
                    labelStyle: const TextStyle(color: primaryPurple),
                    hintText: 'El nombre de tu moto',
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primaryPurple),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Motorcycle Description Field
                TextFormField(
                  controller: _descriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Edita descripción',
                    labelStyle: const TextStyle(color: primaryPurple),
                    hintText: 'Ingresa una descripción',
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primaryPurple),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa una descripción';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // Update Motorcycle Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: _updateMotorcycle,
                  child: const Text(
                    'Actualizar moto',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
