import 'package:flutter/foundation.dart';
import 'package:ceiba/users_manager/repository/controllers/users_manager_repository_controller.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';

class UserManagerProvider extends ChangeNotifier {
  final UsersManagerRepositoryController _usersManagerRepositoryController;
  List<User> originalUsers = [];
  List<User> usersDisplayList = [];

  UserManagerProvider(this._usersManagerRepositoryController);

  void fetchUsers() async {
    originalUsers = await _usersManagerRepositoryController.fetchAllUsers();
    usersDisplayList = originalUsers;
    notifyListeners();
  }

  void searchUserByName(String name) {
    usersDisplayList = originalUsers.where((user) => user.name.toUpperCase().contains(name.toUpperCase())).toList();
    notifyListeners();
  }
}
