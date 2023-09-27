import 'package:bloc/bloc.dart';
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
    } catch (e) {}
  }
}
