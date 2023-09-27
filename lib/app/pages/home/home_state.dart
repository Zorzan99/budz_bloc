// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:budz_bloc/app/models/user_model.dart';

enum HomeStateStatus {
  initial,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<UserModel> users;
  const HomeState({
    required this.users,
    required this.status,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        users = [];

  @override
  List<Object> get props => [users, status];

  HomeState copyWith({
    HomeStateStatus? status,
    List<UserModel>? users,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }
}
