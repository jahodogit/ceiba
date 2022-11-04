import 'package:ceiba/users_manager/repository/models/user_model.dart';

abstract class IUserRepository {
  Future<List<User>> getAllUsers();
}
