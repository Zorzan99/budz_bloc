import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class ModalWidget extends StatelessWidget {
  const ModalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight(.7),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Tem certeza que deseja encerrar a jornada do seu melhor amigo?',
                style: context.textStyles.textBold.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/Triste1.png',
              ),
              Text(
                'Todas as suas informações e a evolução do seu pet no aplicativo serão apagadas. Essa ação não pode ser desfeita.',
                style: context.textStyles.textRegular.copyWith(fontSize: 14),
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
                  style: context.textStyles.textBold
                      .copyWith(fontSize: 14, color: context.colors.secondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
