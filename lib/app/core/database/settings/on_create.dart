import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class OnCreate {
  OnCreate._();
  static onCreate(Database db, int version) {
    debugPrint('onCreate Chamado');
    final batch = db.batch();

    batch.execute(
        '''
        CREATE TABLE pets(
          idTabela INTEGER primary key autoincrement not null,
          id VARCHAR
        )
      ''');
    batch.execute(
        '''
        CREATE TABLE user(
          idTabela INTEGER primary key autoincrement not null,
          email VARCHAR,
          generalPetID VARCHAR,
          thirdPartyLoginIdToken VARCHAR,
          pushAllow VARCHAR,
          fullname VARCHAR,
          thirdPartyLoginServerAuthCode VARCHAR,
          photoUrl VARCHAR,
          updatedDate VARCHAR,
          createdDate VARCHAR,
          isThirdPartyLogin VARCHAR,
          phoneNumber VARCHAR,
          id VARCHAR,
          nickname VARCHAR,
          birthdate VARCHAR,
          gender VARCHAR,
          password VARCHAR

        )
      ''');

    batch.execute(
        '''
          CREATE TABLE subscription(
          idTabela INTEGER primary key autoincrement not null,
          userType VARCHAR,
          createdAt VARCHAR,
          userId VARCHAR,
          updatedAt VARCHAR,
          subscriptionStatus VARCHAR,
          id VARCHAR,
          subscriptionType VARCHAR
          )

       ''');
    batch.commit();
  }
}
