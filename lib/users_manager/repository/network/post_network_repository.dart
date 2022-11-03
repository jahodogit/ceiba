import 'package:ceiba/users_manager/models/post_model.dart';
import 'package:ceiba/users_manager/repository/ipost_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PostNetworkRepository extends IPostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    Iterable object = convert.json.decode(response.body);

    if (response.statusCode == 200) {
      return object.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception("Not fetch items");
    }
  }
}
