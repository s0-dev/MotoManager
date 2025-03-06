import 'package:shelf_router/shelf_router.dart';
import '../services/auth_service.dart';
import '../services/motorcycle_service.dart';
import 'auth_routes.dart';
import 'motorcycle_routes.dart';

Router createApiRouter(
  AuthService authService,
  MotorcycleService motorcycleService,
) {
  final router = Router();

  router.mount('/auth/', AuthRoutes(authService).router.call);
  router.mount('/motorcycle/', MotorcycleRoutes(motorcycleService).router.call);

  return router;
}
