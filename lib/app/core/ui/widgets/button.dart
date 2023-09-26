// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const Button({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
    required this.borderRadius,
    this.textStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          textStyle: textStyle,
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
