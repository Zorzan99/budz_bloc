import 'package:budz_bloc/app/pages/home/home_controller.dart';
import 'package:budz_bloc/app/pages/home/home_page.dart';
import 'package:budz_bloc/app/repositories/user/user_repository.dart';
import 'package:budz_bloc/app/repositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
