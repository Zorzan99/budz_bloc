import 'package:budz_bloc/app/core/ui/theme/theme_config.dart';
import 'package:budz_bloc/app/pages/confirm_deletion/confirm_deletion_page.dart';
import 'package:budz_bloc/app/pages/end/end_page.dart';
import 'package:budz_bloc/app/pages/home/home_page.dart';
import 'package:budz_bloc/app/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class BudzApp extends StatelessWidget {
  const BudzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budz App',
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/deletionPage': (context) => const ConfirmDeletionPage(),
        '/endPage': (context) => const EndPage(),
      },
    );
  }
}
