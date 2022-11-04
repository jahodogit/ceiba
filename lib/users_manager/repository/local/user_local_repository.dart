import 'package:ceiba/users_manager/repository/ipost_repository.dart';
import 'package:ceiba/users_manager/repository/iuser_repository.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:hive/hive.dart';

class UserLocalRepository extends IUserRepository {
  late final Box<User> users;

  Future<void> init() async => users = await Hive.openBox<User>("users");

  @override
  Future<List<User>> getAllUsers() async {
    return users.values.toList();
  }

  void insert(User user) => users.add(user);
  void insertAll(List<User> userList) => users.addAll(userList);

  bool validateDataExist() => users.values.isEmpty;
}
