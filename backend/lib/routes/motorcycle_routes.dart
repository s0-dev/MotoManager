import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/motorcycle_service.dart';

// TODO: change to API instead of routes
class MotorcycleRoutes {
  final MotorcycleService motorcycleService;

  MotorcycleRoutes(this.motorcycleService);

  Router get router {
    final router = Router();

    // Add a motorcycle
    router.post('/add-motorcycle', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      return motorcycleService.addMotorcycle(data);
    });
    router.put('/edit-motorcycle', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload) as Map<String, dynamic>;
      return motorcycleService.editMotorcycle(data);
    });

    return router;
  }
}
