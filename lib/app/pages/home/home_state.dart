// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:budz_bloc/app/models/user_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<UserModel> users;
  final Uint8List? profileImage;
  final String? errorMessage;

  final Uint8List? selectedPhoto; // Foto selecionada

  const HomeState({
    required this.users,
    required this.status,
    this.profileImage,
    this.selectedPhoto,
    this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        users = [],
        profileImage = null,
        selectedPhoto = null,
        errorMessage = null;

  @override
  List<Object?> get props => [
        users,
        status,
        profileImage,
      ];

  HomeState copyWith({
    HomeStateStatus? status,
    List<UserModel>? users,
    Uint8List? profileImage,
    String? errorMessage,
    Uint8List? selectedPhoto,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
      profileImage: profileImage ?? this.profileImage,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedPhoto: selectedPhoto ?? this.selectedPhoto,
    );
  }
}
