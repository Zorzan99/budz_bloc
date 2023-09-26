import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/pages/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
