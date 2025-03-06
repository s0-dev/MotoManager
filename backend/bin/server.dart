import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:backend/database/postgres.dart';
import 'package:backend/database/migrations.dart';
import 'package:backend/routes/api_router.dart';
import 'package:backend/services/auth_service.dart';
import 'package:backend/services/motorcycle_service.dart';

Future<void> main() async {
  final db = PostgreSQLDatabase();
  await db.connect();

  final authService = AuthService(db);
  final motorcycleService = MotorcycleService(db);
  final router = createApiRouter(authService, motorcycleService);

  await runMigrations();

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);
  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);

  print('🚀 Server running on port ${server.port}');
}
