import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: child,
    );
  }
}