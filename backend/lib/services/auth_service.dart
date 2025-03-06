import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import '../database/postgres.dart';

// Handles registering a new user and logging in.
// It hashes passwords (using SHA-256) and executes SQL queries to insert or fetch user data.

class AuthService {
  final PostgreSQLDatabase db;

  AuthService(this.db);

  // TODO: module the endpoints into separated files.
  // TODO: integrate flutter into backend.

  Future<Response> registerUser(Map<String, dynamic> data) async {
    final String? email = data['email'];
    final String? password = data['password'];

    if (email == null || password == null) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Email and password are required'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final passwordHash = sha256.convert(utf8.encode(password)).toString();

    try {
      final result = await db.connection.execute(
        // raw string literal. doesn't interpret nothing.
        r'INSERT INTO users (email, password_hash) VALUES ($1, $2) RETURNING id',
        parameters: [email, passwordHash],
      );

      final userId = result.first[0];
      return Response.ok(
        jsonEncode({'message': 'User registered', 'userId': userId}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': 'Registration failed: $e'}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  }

  Future<Response> loginUser(Map<String, dynamic> data) async {
    final String? email = data['email'];
    final String? password = data['password'];

    if (email == null || password == null) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Email and password are required'}),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final passwordHash = sha256.convert(utf8.encode(password)).toString();

    try {
      final query = r'SELECT id, password_hash FROM users WHERE email = $1';
      final result = await db.connection.execute(query, parameters: [email]);

      if (result.isEmpty) {
        return Response.notFound(
          jsonEncode({'error': 'User not found'}),
          headers: {'Content-Type': 'application/json'},
        );
      }

      final row = result.first.toColumnMap();
      if (row['password_hash'] != passwordHash) {
        return Response.forbidden(
          jsonEncode({'error': 'Invalid credentials'}),
          headers: {'Content-Type': 'application/json'},
        );
      }

      return Response.ok(
        jsonEncode({'message': 'Login successful', 'userId': row['id']}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': 'Login failed: $e'}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  }
}
