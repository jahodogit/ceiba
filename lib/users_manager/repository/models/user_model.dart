import 'package:ceiba/users_manager/repository/models/post_model.dart';
import "package:hive/hive.dart";
part "user_model.g.dart";


@HiveType(typeId: 2)
class User {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  List<Post> posts = [];

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
