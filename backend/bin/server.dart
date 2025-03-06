import 'package:backend/database/postgres.dart';

void main() async {
  final db = PostgreSQLDatabase();
  await db.connect();

  // Start your server (e.g., with Alfred, Shelf, etc.)
  print('🚀 Server running');
}
