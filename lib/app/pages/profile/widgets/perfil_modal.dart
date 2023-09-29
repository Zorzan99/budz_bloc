import 'package:budz_bloc/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PerfilModal extends StatelessWidget {
  final String text;
  final IconData iconLeading;
  final IconData iconTrailing;
  final VoidCallback onTap;

  const PerfilModal(
      {Key? key,
      required this.text,
      required this.iconLeading,
      required this.iconTrailing,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(17),
      ),
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              iconLeading,
            ),
            const SizedBox(width: 20),
            Text(text, style: context.textStyles.textRegular),
            const Spacer(),
            Icon(
              iconTrailing,
              size: 13, // Cor do segundo ícone
            ),
          ],
        ),
      ),
    );
  }
}
