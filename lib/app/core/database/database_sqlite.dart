import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'settings/on_configure.dart';
import 'settings/on_create.dart';
import 'settings/on_downgrade.dart';
import 'settings/on_upgrade.dart';

class DatabaseSqlite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    // print(databasePath);
    final databaseFinalPath = join(databasePath, 'BUDZ.db');
    return openDatabase(
      databaseFinalPath,
      version: 1,
      onConfigure: (db) => OnConfigure.onConfigure(db),
      //chamado somente no momento da criacao do banco
      //primeira vez em que instala o app
      onCreate: (db, version) => OnCreate.onCreate(db, version),
      //sera chamado sempre que existir uma nova atualizaçao pra cima (1 -> 2)
      onUpgrade: (Database db, int oldVersion, int version) =>
          OnUpgrade.onUpgrade(db, oldVersion, version),
      //sera chamado sempre que existir uma alteraçao para baixo no banco (2 -> 1)
      onDowngrade: (Database db, int oldVersion, int version) =>
          OnDowngrade.onDowngrade(db, oldVersion, version),
    );
  }
}
