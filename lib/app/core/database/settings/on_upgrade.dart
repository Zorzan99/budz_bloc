import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class OnUpgrade {
  OnUpgrade._();
  static onUpgrade(Database db, int oldVersion, int version) {
    debugPrint('onUpgrade Chamado');
    final batch = db.batch();
     
    // batch.execute('''
    //      alter table servicos
    //      add column id_user INTEGER
    //       ''');
    // batch.execute('''
    //      alter table servicos
    //      add column id_user_company TEXT
    //       ''');
    batch.commit();
  }
}
