import 'package:budz_bloc/app/core/ui/base_state/base_state.dart';
import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/pages/home/home_controller.dart';
import 'package:budz_bloc/app/pages/home/home_state.dart';
import 'package:budz_bloc/app/pages/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  late Database database;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      controller.findUser();
      if (controller.state.selectedPhoto != null) {
        controller.updateSelectedPhoto(controller.state.selectedPhoto);
      }
      controller.loadImageFromDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.percentHeight(.15),
        title: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {
            state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? '');
              },
            );
          },
          buildWhen: (previous, current) => current.status.matchAny(
            any: () => false,
            initial: () => true,
            loaded: () => true,
          ),
          builder: (context, state) {
            if (state.status == HomeStateStatus.initial &&
                state.users.isNotEmpty) {
              final user = state.users[0]; // Supondo que haja apenas um usuário
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state.profileImage != null
                      ? CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.memory(
                              state.profileImage!,
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 45,
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
                        user.fullname, // Nome do usuário retornado pela API
                        style: context.textStyles.textBold.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.email, // Email do usuário
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              // Se o estado estiver carregando ou não houver usuários, você pode exibir um indicador de carregamento ou mensagem de erro, se necessário.
              return const Text(
                  'erro'); // Exemplo de indicador de carregamento.
            }
          },
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
