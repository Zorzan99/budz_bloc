import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:budz_bloc/app/core/database/database_sqlite.dart';
import 'package:budz_bloc/app/pages/home/home_state.dart';
import 'package:budz_bloc/app/repositories/user/user_repository.dart';

class HomeController extends Cubit<HomeState> {
  final UserRepository _userRepository;
  HomeController(
    this._userRepository,
  ) : super(HomeState.initial());

  Future<void> findUser() async {
    try {
      final users = await _userRepository.findUser();
      emit(state.copyWith(status: HomeStateStatus.initial, users: users));
    } catch (e, s) {
      log('Erro ao buscar dados do usuarop', error: e, stackTrace: s);
    }
  }

  Future<Uint8List?> getImageFromDatabase() async {
    try {
      final database = await DatabaseSqlite().openConnection();

      final isTableExists = await database.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='profile_images'");

      if (isTableExists.isNotEmpty) {
        final result = await database.query('profile_images');
        if (result.isNotEmpty) {
          final imageBytes = result.first['imageBytes'] as Uint8List;
          print('Dados da imagem do banco de dados lidos com sucesso');
          return imageBytes;
        }
      }
    } catch (e) {
      log('Erro ao recuperar a imagem do banco de dados', error: e);
    }
    return null; // Retorna nulo se não encontrar a imagem no banco de dados
  }

  Future<void> loadImageFromDatabase() async {
    final imageBytes = await getImageFromDatabase();
    if (imageBytes != null) {
      updateSelectedPhoto(Uint8List.fromList(imageBytes));
    } else {
      emit(state.copyWith(profileImage: null));
    }
  }

  void updateSelectedPhoto(Uint8List? imageBytes) {
    final newState = state.copyWith(
      profileImage: imageBytes,
    );
    emit(newState);
  }
}
