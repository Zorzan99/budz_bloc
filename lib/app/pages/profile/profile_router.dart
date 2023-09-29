import 'package:budz_bloc/app/pages/profile/profile_controller.dart';
import 'package:budz_bloc/app/pages/profile/profile_page.dart';
import 'package:budz_bloc/app/repositories/user/user_repository.dart';
import 'package:budz_bloc/app/repositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRouter {
  ProfileRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => ProfileController(
              context.read(),
            ),
          )
        ],
        child: const ProfilePage(),
      );
}
