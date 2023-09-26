// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CheckBoxListTileWidget extends StatelessWidget {
  final Color? titleColor;
  final String title;
  final bool? value;
  final void Function(bool?)? onChanged;
  final Color? selectedTileColor;
  final ShapeBorder? shape;
  const CheckBoxListTileWidget({
    Key? key,
    this.titleColor,
    required this.title,
    this.value,
    this.onChanged,
    this.selectedTileColor,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: CheckboxListTile(
          selectedTileColor: selectedTileColor,
          contentPadding: const EdgeInsets.all(5),
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: titleColor,
          value: value,
          shape: shape,
          title: Text(title),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: onChanged),
    );
  }
}
