import "package:hive/hive.dart";
part "post_model.g.dart";

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  final int userid;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  Post({required this.userid, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userid: json["userid"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
