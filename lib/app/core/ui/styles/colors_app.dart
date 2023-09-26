import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i => _instance ??= ColorsApp._();

  Color get primary => const Color(0XFF171D1F);
  Color get secondary => const Color(0XFF2371EE);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
