import 'package:flutter/material.dart';

class BudzApp extends StatelessWidget {
  const BudzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budz App',
      routes: {
        '/': (context) => Container(),
      },
    );
  }
}
