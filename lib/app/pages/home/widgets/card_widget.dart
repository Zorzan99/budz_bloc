import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String label;
  final IconData iconLeading;
  final BorderRadius borderRadius;
  final VoidCallback onTap;
  const CardWidget(
      {Key? key,
      required this.label,
      required this.iconLeading,
      required this.borderRadius,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(color: Colors.grey[400]!, width: 1.0)),
          child: ListTile(
            leading: Icon(iconLeading),
            title: Text(label),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
