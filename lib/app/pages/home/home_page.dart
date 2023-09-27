import 'dart:convert';

import 'package:budz_bloc/app/core/database/CRUD/insert_d_b.dart';
import 'package:budz_bloc/app/core/database/database_sqlite.dart';
import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/models/id_pets_model.dart';
import 'package:budz_bloc/app/models/list_pets_model.dart';
import 'package:budz_bloc/app/pages/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database database;
  @override
  void initState() {
    super.initState();
    startDB();
  }

  Future<void> startDB() async {
    database = await DatabaseSqlite().openConnection();
    insertValue(database);
  }

  Future<void> insertValue(Database database) async {
    IdPetsModel idPetsModel1 =
        IdPetsModel(id: "48E792A6-EF69-467E-B9FB-E4C272AE23AF");
    IdPetsModel idPetsModel2 =
        IdPetsModel(id: "B05C4E66-4E5E-4B4D-8BDE-B7AFC9F476FF");
    ListPetsModel listPets = ListPetsModel(pets: [idPetsModel1, idPetsModel2]);
    for (var element in listPets.pets) {
      final bytes = utf8.encode(element.id);
      final base64Str = base64.encode(bytes);
      InsertDB.InsertTablePets(database, base64Str);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.percentHeight(.15),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv_oKVRmZPImkFJYc9L1satXl0Do-JEq5ejVscMqLAFA&s'),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John',
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'johndoe@gmail.com',
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.travel_explore_outlined,
              ),
              label: 'Jornadas',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
              ),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Perfil',
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: context.colors.secondary,
          unselectedItemColor: context.colors.primary,
        ),
      ),
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CardWidget(
                onTap: () {},
                label: 'Meus pets',
                iconLeading: Icons.pets_outlined,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              CardWidget(
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                label: 'Editar perfil',
                iconLeading: Icons.person_outline,
                borderRadius: BorderRadius.zero,
              ),
              CardWidget(
                onTap: () {},
                label: 'Ferramentas',
                iconLeading: Icons.build_outlined,
                borderRadius: BorderRadius.zero,
              ),
              CardWidget(
                onTap: () {},
                label: 'Gerenciar Assinatura',
                iconLeading: Icons.assignment_outlined,
                borderRadius: BorderRadius.zero,
              ),
              CardWidget(
                onTap: () {},
                label: 'Alterar Senha',
                iconLeading: Icons.lock_clock_outlined,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              const SizedBox(
                height: 30,
              ),
              CardWidget(
                onTap: () {},
                label: 'Sair',
                iconLeading: Icons.logout_outlined,
                borderRadius: BorderRadius.circular(20),
              ),
              Text(
                'Versão 1.0.1',
                style: context.textStyles.textLigth.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
