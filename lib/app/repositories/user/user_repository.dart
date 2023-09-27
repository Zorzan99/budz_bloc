import 'package:budz_bloc/app/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> findUser();
}
