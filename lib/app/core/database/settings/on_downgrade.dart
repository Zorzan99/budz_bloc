import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class OnDowngrade {
  OnDowngrade._();
   static onDowngrade(Database db, int oldVersion, int version) {
      debugPrint('onCreate Chamado');
    final batch = db.batch();

    batch.commit();
  }
}
