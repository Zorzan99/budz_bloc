import 'dart:developer';
import 'dart:typed_data';
import 'package:budz_bloc/app/core/database/database_sqlite.dart';
import 'package:budz_bloc/app/pages/profile/profile_state.dart';
import 'package:budz_bloc/app/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends Cubit<ProfileState> {
  final UserRepository _userRepository;

  ProfileController(
    this._userRepository,
  ) : super(ProfileState.initial());

  Future<void> findUser() async {
    try {
      final users = await _userRepository.findUser();
      emit(state.copyWith(status: ProfileStateStatus.initial, users: users));
    } catch (e, s) {
      log('Erro ao buscar dados do usuário', error: e, stackTrace: s);
    }
  }

  Future<void> accessGallery() async {
    try {
      emit(state.copyWith(
        cameraState: ProfileStateStatus.cameraInitial,
      )); // Estado inicial

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();

        emit(state.copyWith(
          status: ProfileStateStatus.initial,
          selectedPhotoPath: pickedFile.path,
          cameraState: ProfileStateStatus.cameraCaptureSuccess,
          profileImage: imageBytes, // Use profileImage em vez de selectedPhoto
        ));

        // Salve a imagem no banco de dados
        await saveImage(imageBytes);
      } else {
        emit(state.copyWith(
          cameraState: ProfileStateStatus.cameraCaptureFailure,
        ));
      }
    } catch (e, s) {
      log('Erro ao acessar a galeria', error: e, stackTrace: s);
      emit(state.copyWith(
        cameraState: ProfileStateStatus.cameraCaptureFailure,
      ));
    }
  }

  Future<void> accessCamera() async {
    try {
      emit(state.copyWith(
        cameraState: ProfileStateStatus.cameraInitial,
      )); // Estado inicial

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();

        emit(state.copyWith(
          status: ProfileStateStatus.initial,
          selectedPhotoPath: pickedFile.path,
          cameraState: ProfileStateStatus.cameraCaptureSuccess,
          profileImage: imageBytes, // Use profileImage em vez de selectedPhoto
        ));

        // Salve a imagem no banco de dados
        await saveImage(imageBytes);
      } else {
        emit(state.copyWith(
          cameraState: ProfileStateStatus.cameraCaptureFailure,
        ));
      }
    } catch (e, s) {
      log('Erro ao acessar a câmera', error: e, stackTrace: s);
      emit(state.copyWith(
        cameraState: ProfileStateStatus.cameraCaptureFailure,
      ));
    }
  }

  void updateSelectedPhoto(Uint8List? imageBytes) {
    final newState = state.copyWith(
      profileImage: imageBytes,
    );
    emit(newState);
  }

  Future<void> saveImage(Uint8List imageBytes) async {
    try {
      final database = await DatabaseSqlite().openConnection();
      await database.execute('''
      CREATE TABLE IF NOT EXISTS profile_images (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageBytes BLOB
      )
    ''');

      await database.insert('profile_images', {'imageBytes': imageBytes});
    } catch (e, s) {
      log('Erro ao salvar a imagem no banco de dados: $e',
          error: e, stackTrace: s);
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
    }
  }
}
