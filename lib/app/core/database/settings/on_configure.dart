

class OnConfigure {
  OnConfigure._();
   static onConfigure (db) async {
    // print('onConfigure Chamado');
    await db.execute('PRAGMA foreing_keys = ON');
  }
}
