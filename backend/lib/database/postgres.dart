import 'package:postgres/postgres.dart';
import 'package:dotenv/dotenv.dart';

class PostgreSQLDatabase {
  late Connection _connection;

  Future<void> connect() async {
    final env = DotEnv(includePlatformEnvironment: true)..load();

    // 1. Asignar la conexión a la variable _connection
    _connection = await Connection.open(
      Endpoint(
        host: env['DB_HOST']!,
        port: int.parse(env['DB_PORT']!),
        database: env['DB_NAME']!,
        username: env['DB_USER']!,
        password: env['DB_PASSWORD']!,
      ),
    );

    // 2. Verificar la conexión
    await _connection.execute('SELECT 1');
    print('✅ Connected to PostgreSQL');
  }

  Connection get connection => _connection;
}
