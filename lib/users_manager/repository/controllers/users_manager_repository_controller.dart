import 'package:ceiba/users_manager/repository/local/user_local_repository.dart';
import 'package:ceiba/users_manager/repository/models/post_model.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:ceiba/users_manager/repository/network/post_network_repository.dart';
import 'package:ceiba/users_manager/repository/network/user_network_repository.dart';

class UsersManagerRepositoryController {
  final UserNetworkRepository _userNetworkRepository;
  final PostNetworkRepository _postNetworkRepository;

  final UserLocalRepository _userLocalRepository;

  UsersManagerRepositoryController(this._userNetworkRepository, this._postNetworkRepository, this._userLocalRepository) {
    _userLocalRepository.init();
  }

  Future<List<User>> fetchAllUsers() async {
    if (_userLocalRepository.validateDataExist()) {
      return _userLocalRepository.getAllUsers();
    } else {
      return fetchUserAndPost();
    }
  }

  Future<List<User>> fetchUserAndPost() async {
    List<User> users = await _userNetworkRepository.getAllUsers();
    List<Post> posts = await _postNetworkRepository.getAllPosts();

    for (User user in users) {
      user.posts = posts.where((post) => post.userid == user.id).toList();
    }

    _userLocalRepository.insertAll(users);
    return await _userLocalRepository.getAllUsers();
  }
}
