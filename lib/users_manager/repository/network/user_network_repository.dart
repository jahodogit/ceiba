import 'package:ceiba/users_manager/repository/iuser_repository.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserNetworkRepository extends IUserRepository {
  @override
  Future<List<User>> getAllUsers() async {
    http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    Iterable object = convert.json.decode(response.body);

    if (response.statusCode == 200) {
      return object.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Not fetch items");
    }
  }
}
