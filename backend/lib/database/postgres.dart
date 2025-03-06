import 'package:postgres/postgres.dart';
import 'package:dotenv/dotenv.dart';

class PostgreSQLDatabase {
  late Connection _connection;

  Future<void> connect() async {
    final env = DotEnv(includePlatformEnvironment: true)..load();

    // 1. assign env variables to the connection
    _connection = await Connection.open(
      Endpoint(
        host: env['DB_HOST']!,
        port: int.parse(env['DB_PORT']!),
        database: env['DB_NAME']!,
        username: env['DB_USER']!,
        password: env['DB_PASSWORD']!,
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    // 2. Verify the connection
    await _connection.execute('SELECT 1');
    print('✅ Connected to PostgreSQL');
  }

  Connection get connection => _connection;
}
