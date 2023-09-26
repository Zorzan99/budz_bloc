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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: context.colors.primary,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.travel_explore_outlined,
              color: context.colors.primary,
            ),
            label: 'Jornadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: context.colors.primary,
            ),
            label: 'ChatBot',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: context.colors.primary,
            ),
            label: 'Perfil',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF0F0F0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: context.percentHeight(.2),
              width: double.infinity,
              child: Row(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John',
                        style: context.textStyles.textBold.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
            const CardWidget(
              label: 'Meus pets',
              iconLeading: Icons.pets_outlined,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            const CardWidget(
              label: 'Editar perfil',
              iconLeading: Icons.person_outline,
              borderRadius: BorderRadius.zero,
            ),
            const CardWidget(
              label: 'Ferramentas',
              iconLeading: Icons.build_outlined,
              borderRadius: BorderRadius.zero,
            ),
            const CardWidget(
              label: 'Gerenciar Assinatura',
              iconLeading: Icons.assignment_outlined,
              borderRadius: BorderRadius.zero,
            ),
            const CardWidget(
              label: 'Alterar Senha',
              iconLeading: Icons.lock_clock_outlined,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            const SizedBox(
              height: 30,
            ),
            CardWidget(
              label: 'Sair',
              iconLeading: Icons.logout_outlined,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
      ),
    );
  }
}
