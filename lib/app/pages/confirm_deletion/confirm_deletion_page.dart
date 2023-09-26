import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:budz_bloc/app/core/ui/widgets/button.dart';
import 'package:budz_bloc/app/pages/confirm_deletion/widgets/check_box_list_tile.dart';
import 'package:flutter/material.dart';

class ConfirmDeletionPage extends StatefulWidget {
  const ConfirmDeletionPage({Key? key}) : super(key: key);

  @override
  State<ConfirmDeletionPage> createState() => _ConfirmDeletionPageState();
}

class _ConfirmDeletionPageState extends State<ConfirmDeletionPage> {
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool option5 = false;
  bool option6 = false;
  bool option7 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Button(
          width: context.screenWidth,
          label: 'CONTINUAR',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/endPage', (route) => false);
          },
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Conta pra gente, qual o motivo da exclusão?',
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    CheckBoxListTileWidget(
                      value: option1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option1 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option1 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Eu não uso mais o Budz',
                      onChanged: (value) {
                        setState(() {
                          option1 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option2 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option2 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Valores das assinaturas',
                      onChanged: (value) {
                        setState(() {
                          option2 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option3 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option3 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Insatisfação com os serviços oferecidos',
                      onChanged: (value) {
                        setState(() {
                          option3 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option4 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option4 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Tive problemas técnicos',
                      onChanged: (value) {
                        setState(() {
                          option4 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option5 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option5 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Conteúdos ruins ou irrelevantes',
                      onChanged: (value) {
                        setState(() {
                          option5 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option6 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option6 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Experiência e usabilidade',
                      onChanged: (value) {
                        setState(() {
                          option6 = value!;
                        });
                      },
                    ),
                    CheckBoxListTileWidget(
                      value: option7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color:
                              option7 ? const Color(0XFFDFFAFD) : Colors.grey,
                        ),
                      ),
                      titleColor:
                          option7 ? const Color(0XFFDFFAFD) : Colors.white,
                      title: 'Outro',
                      onChanged: (value) {
                        setState(() {
                          option7 = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
