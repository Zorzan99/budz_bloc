import 'package:budz_bloc/app/budz_app.dart';
import 'package:budz_bloc/app/core/config/env/env.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const BudzApp());
}
