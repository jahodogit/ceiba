import 'package:flutter/foundation.dart';
import 'package:ceiba/users_manager/repository/controllers/users_manager_repository_controller.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';

class UserManagerProvider extends ChangeNotifier {
  final UsersManagerRepositoryController _usersManagerRepositoryController;
  List<User> _originalUsers = [];
  List<User> usersDisplayList = [];

  UserManagerProvider(this._usersManagerRepositoryController);

  void fetchUsers() async {
    _originalUsers = await _usersManagerRepositoryController.fetchAllUsers();
    usersDisplayList = _originalUsers;
    notifyListeners();
  }

  void searchUserByName(String name) {
    usersDisplayList = _originalUsers.where((user) => user.name.contains(name)).toList();
    notifyListeners();
  }
}
