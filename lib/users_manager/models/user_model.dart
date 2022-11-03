import 'package:ceiba/users_manager/models/post_model.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final List<Post> posts = [];

  User({required this.id, required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
    );
  }
}
