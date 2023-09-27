import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/core/ui/widgets/button.dart';
import 'package:budz_bloc/app/pages/profile/widgets/modal_widget.dart';
import 'package:budz_bloc/app/pages/profile/widgets/perfil_modal.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar perfil',
          style: context.textStyles.textBold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv_oKVRmZPImkFJYc9L1satXl0Do-JEq5ejVscMqLAFA&s'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: context.percentHeight(.25),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(Icons.close)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const PerfilModal(
                                      text: 'Tirar Foto',
                                      iconLeading: Icons.camera_alt_outlined,
                                      iconTrailing:
                                          Icons.arrow_forward_ios_rounded,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const PerfilModal(
                                      text: 'Escolher Foto',
                                      iconLeading: Icons.phone,
                                      iconTrailing:
                                          Icons.arrow_forward_ios_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'ALTERAR FOTO',
                    style: context.textStyles.textExtraBold.copyWith(
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ),
              Text('Nome', style: context.textStyles.textBold),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'John Doe',
                ),
              ),
              const SizedBox(height: 15),
              Text('Email', style: context.textStyles.textBold),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'johndoe@gmail.com',
                ),
              ),
              const SizedBox(height: 15),
              Text('Gênero', style: context.textStyles.textBold),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'Masculino',
                    child: Text('Masculino'),
                  ),
                  DropdownMenuItem(
                    value: 'Feminino',
                    child: Text('Feminino'),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              Button(
                borderRadius: BorderRadius.circular(16),
                width: context.screenWidth,
                label: 'SALVAR',
                textStyle:
                    context.textStyles.textExtraBold.copyWith(fontSize: 16),
                onPressed: () {
                  Navigator.of(context).pushNamed('/deletionPage');
                },
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return const ModalWidget();
                      },
                    );
                  },
                  child: Text(
                    'Excluir Conta',
                    style: context.textStyles.textBold.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
