import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../database/postgres.dart';

// Services encapsulates the business logic. "how data is processed and interacted with the database."
// Handles adding a new motorcycle by inserting data into the motorcycles table
class MotorcycleService {
  final PostgreSQLDatabase db;

  MotorcycleService(this.db);

  // TODO: module the endpoints into separated files.
  // TODO: add GET for seeying in flutter.

  Future<Response> addMotorcycle(Map<String, dynamic> data) async {
    final int? userId = data['user_id'];
    final String? name = data['name'];
    final String? description = data['description'];

    if (userId == null || name == null) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Missing user_id or name'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    try {
      final result = await db.connection.execute(
        r'INSERT INTO motorcycles (user_id, name, description) VALUES ($1, $2, $3) RETURNING id',
        parameters: [userId, name, description],
      );

      final motorcycleId = result.first[0];
      return Response.ok(
        jsonEncode({
          'message': 'Motorcycle added',
          'motorcycleId': motorcycleId,
        }),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': 'Failed to add motorcycle: $e'}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  }

  Future<Response> editMotorcycle(Map<String, dynamic> data) async {
    final int? motorcycleId = data['id'];
    final String? name = data['name'];
    final String? description = data['description'];

    if (motorcycleId == null || name == null) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Missing id or name'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    try {
      final result = await db.connection.execute(
        'UPDATE motorcycles SET name = \$1, description = \$2 WHERE id = \$3',
        parameters: [name, description, motorcycleId],
      );

      if (result.affectedRows == 0) {
        return Response.notFound(
          jsonEncode({'error': 'Motorcycle not found'}),
          headers: {'Content-Type': 'application/json'},
        );
      }

      return Response.ok(
        jsonEncode({'message': 'Motorcycle updated successfully'}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': 'Failed to update motorcycle: $e'}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  }
}
