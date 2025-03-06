import 'package:backend/database/postgres.dart';

Future<void> runMigrations() async {
  final db = PostgreSQLDatabase();
  await db.connect();

  await db.connection.execute('''
    CREATE TABLE IF NOT EXISTS users (
      id SERIAL PRIMARY KEY,
      email TEXT UNIQUE NOT NULL,
      password_hash TEXT NOT NULL
    );
  ''');

  await db.connection.execute('''
    CREATE TABLE IF NOT EXISTS motorcycles (
      id SERIAL PRIMARY KEY,
      user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
      name TEXT NOT NULL,
      description TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  ''');

  print('✅ Database migrations completed.');
}
