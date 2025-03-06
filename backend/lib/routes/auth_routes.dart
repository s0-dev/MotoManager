import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/auth_service.dart';

class AuthRoutes {
  final AuthService authService;

  AuthRoutes(this.authService);

  Router get router {
    final router = Router();

    // Register a new user
    router.post('/register', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      return authService.registerUser(data);
    });

    // Login an existing user
    router.post('/login', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      return authService.loginUser(data);
    });

    return router;
  }
}
