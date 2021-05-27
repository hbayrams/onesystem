import 'package:mysql1/mysql1.dart';

class MysqlConn {
  static String host = 'remotemysql.com',
      user = 'nQ9Fu2zziy',
      password = 'odtQEyU3Bs',
      db = 'nQ9Fu2zziy',
      tablename = 'user';
  static int port = 3306;

  MysqlConn();

  Future<MySqlConnection> getConnection() async {
    try {
      final connect = await MySqlConnection.connect(
        ConnectionSettings(
            host: host, port: port, user: user, password: password, db: db),
      );
      return connect;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
