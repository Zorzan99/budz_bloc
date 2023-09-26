import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/core/ui/widgets/button.dart';
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
              child: Text(
                'ALTERAR FOTO',
                style: context.textStyles.textExtraBold.copyWith(
                  color: context.colors.secondary,
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
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: context.percentHeight(.7),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'Tem certeza que deseja encerrar a jornada do seu melhor amigo?',
                                  style: context.textStyles.textBold
                                      .copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'assets/images/Triste1.png',
                                ),
                                Text(
                                  'Todas as suas informações e a evolução do seu pet no aplicativo serão apagadas. Essa ação não pode ser desfeita.',
                                  style: context.textStyles.textRegular
                                      .copyWith(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Button(
                                  label: 'EXCLUIR CONTA',
                                  width: context.screenWidth,
                                  backgroundColor: Colors.red,
                                  onPressed: () {},
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'CANCELAR',
                                    style: context.textStyles.textBold.copyWith(
                                        fontSize: 14,
                                        color: context.colors.secondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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
    );
  }
}
