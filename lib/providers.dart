import 'package:ceiba/users_manager/controllers/user_manager_provider.dart';
import 'package:ceiba/users_manager/repository/controllers/users_manager_repository_controller.dart';
import 'package:ceiba/users_manager/repository/local/user_local_repository.dart';
import 'package:ceiba/users_manager/repository/network/post_network_repository.dart';
import 'package:ceiba/users_manager/repository/network/user_network_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  ChangeNotifierProvider(
    create: (context) => UserManagerProvider(
      UsersManagerRepositoryController(
        UserNetworkRepository(),
        PostNetworkRepository(),
        UserLocalRepository(),
      ),
    )..fetchUsers(),
  ),
];
