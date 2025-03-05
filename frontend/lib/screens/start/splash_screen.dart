import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // First, define colors from your Figma design
    const Color backgroundColor = Color(0xFF1C1B2E);
    const Color primaryPurple = Color(0xFF9C88FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Content at the top
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo centered at the top
                      // Uncomment and provide the correct path to your image
                      Image.asset(
                        'lib/assets/images/Logo-base.png',
                        width: 250,
                        height: 250,
                      ),

                      // Main Title
                      const Text(
                        'Manejo de tus motos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      const Text(
                        'La app para tener organizado el\n'
                        'mantenimiento de tus motos de\n'
                        'una manera inteligente',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  // "Iniciar sesión" Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to your login screen
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  // ===== ELIMINAR ESTE BOTON, SOLO PARA TESTS =====

                  // Agregar un separador
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to your login screen
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text(
                        'Ir a ver las motos',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                  // ===== ELIMINAR ESTE BOTON, SOLO PARA TESTS =====
                  const SizedBox(height: 16),

                  // "No tienes cuenta? Regístrate"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No tienes una cuenta? ',
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to your registration screen
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                            color: primaryPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
