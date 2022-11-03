import 'package:ceiba/users_manager/models/post_model.dart';

abstract class IPostRepository {
  Future<List<Post>> getAllPosts();
}
