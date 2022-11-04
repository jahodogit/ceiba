import 'package:ceiba/users_manager/repository/models/post_model.dart';

abstract class IPostRepository {
  Future<List<Post>> getAllPosts();
}
