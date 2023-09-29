// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import 'package:budz_bloc/app/models/user_model.dart';

enum ProfileStateStatus {
  initial,
  cameraInitial,
  cameraReady,
  cameraFailure,
  cameraCaptureInProgress,
  cameraCaptureSuccess,
  cameraCaptureFailure,
}

class ProfileState extends Equatable {
  final ProfileStateStatus status;
  final List<UserModel> users;
  final String selectedPhotoPath; // Caminho da foto selecionada
  final ProfileStateStatus cameraState; // Estado da câmera
  final Uint8List? selectedPhoto; // Foto selecionada
  final Uint8List? profileImage;

  const ProfileState({
    required this.status,
    required this.users,
    required this.selectedPhotoPath,
    required this.cameraState,
    this.selectedPhoto, // Foto selecionada
    this.profileImage,
  });

  ProfileState.initial()
      : status = ProfileStateStatus.initial,
        users = [],
        selectedPhotoPath = '',
        cameraState = ProfileStateStatus.cameraInitial,
        selectedPhoto = null, // Inicialmente, não há foto selecionada (null)
        profileImage = null;
  @override
  List<Object?> get props => [
        status,
        users,
        selectedPhotoPath,
        cameraState,
        selectedPhoto,
        profileImage,
      ];

  ProfileState copyWith({
    ProfileStateStatus? status,
    List<UserModel>? users,
    String? selectedPhotoPath,
    ProfileStateStatus? cameraState,
    Uint8List? selectedPhoto,
    Uint8List? profileImage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      users: users ?? this.users,
      selectedPhotoPath: selectedPhotoPath ?? this.selectedPhotoPath,
      cameraState: cameraState ?? this.cameraState,
      selectedPhoto: selectedPhoto ?? this.selectedPhoto,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
