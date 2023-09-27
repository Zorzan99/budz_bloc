import 'package:sqflite/sqflite.dart';

class DeleteDB {
  DeleteDB._();
  static Future<bool> deleteServicos(
    Database dataBase,
    String idCollect,
  ) async {
     await dataBase.rawDelete(
      '''delete from servicos 
        where id = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }

  static Future<bool> deleteVolumeServicos(
    Database dataBase,
    String idCollect,
  ) async {
     await dataBase.rawDelete(
      '''delete from volume_servico 
        where id_servico = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }

  static Future<bool> deleteProdutoServicos(
    Database dataBase,
    String idCollect,
  ) async {
    await dataBase.rawDelete(
      '''delete from produto_servico 
        where id_servico = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }

  static Future<bool> deleteFotosServicos(
    Database dataBase,
    String idCollect,
  ) async {
    await dataBase.rawDelete(
      '''delete from fotos 
        where id_collect = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }

  static Future<bool> deleteAssinaturaServicos(
    Database dataBase,
    String idCollect,
  ) async {
     await dataBase.rawDelete(
      '''delete from assinatura 
        where id_collect = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }

  static Future<bool> deleteCheckListServicos(
    Database dataBase,
    String idCollect,
  ) async {
    await dataBase.rawDelete(
      '''delete from check_list 
        where id_collect = ?''',
      [
        idCollect,
      ],
    );
    return true;
  }
}
