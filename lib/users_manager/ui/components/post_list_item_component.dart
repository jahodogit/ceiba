import 'package:ceiba/themes/themes.dart';
import 'package:ceiba/users_manager/repository/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            post.title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(post.body),
        ),
      ),
    );
  }
}
