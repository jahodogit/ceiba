import 'package:ceiba/users_manager/models/user_model.dart';

abstract class IUserRepository {
  Future<List<User>> getAllUsers();
}
