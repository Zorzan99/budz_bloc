import 'dart:developer';

import 'package:budz_bloc/app/core/exceptions/repository_exception.dart';
import 'package:budz_bloc/app/core/rest_client/custom_dio.dart';
import 'package:budz_bloc/app/models/user_model.dart';
import 'package:budz_bloc/app/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<UserModel>> findUser() async {
    try {
      final result = await dio.get('user');
      return result.data.map<UserModel>((u) => UserModel.fromMap(u)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar dados do usuario', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar usuario');
    }
  }
}
