import 'package:budz_bloc/app/core/provider/application_binding.dart';
import 'package:budz_bloc/app/core/ui/theme/theme_config.dart';
import 'package:budz_bloc/app/pages/confirm_deletion/confirm_deletion_page.dart';
import 'package:budz_bloc/app/pages/end/end_page.dart';
import 'package:budz_bloc/app/pages/home/indexed_page.dart';
import 'package:budz_bloc/app/pages/profile/profile_router.dart';
import 'package:flutter/material.dart';

class BudzApp extends StatelessWidget {
  const BudzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Budz App',
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const IndexedPage(),
          '/profile': (context) => ProfileRouter.page,
          '/deletionPage': (context) => const ConfirmDeletionPage(),
          '/endPage': (context) => const EndPage(),
        },
      ),
    );
  }
}
