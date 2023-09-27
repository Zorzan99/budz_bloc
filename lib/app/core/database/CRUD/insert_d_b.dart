import 'package:sqflite/sqflite.dart';

class InsertDB {
  InsertDB._();

  static Future<void> InsertTablePets(
    Database dataBase,
    String idPetsModel,
  ) async {
    await dataBase.rawInsert(
      '''INSERT INTO pets(
          id
      
          )
          VALUES(
           '$idPetsModel'
          
          )''',
    );
  }
}
