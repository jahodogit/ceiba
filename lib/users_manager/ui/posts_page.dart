import 'package:ceiba/themes/themes.dart';
import 'package:ceiba/users_manager/repository/models/post_model.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:ceiba/users_manager/ui/components/post_list_item_component.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final User user;
  const PostPage({super.key, required this.user});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba de ingreso"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  "${widget.user.name}'s posts",
                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(widget.user.email),
                Text(widget.user.phone)
              ],
            ),
          ),
          //Post list
          Expanded(
            child: widget.user.posts.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.user.posts.length,
                    itemBuilder: (_, index) {
                      Post post = widget.user.posts[index];
                      return PostListItem(post: post);
                    }),
          ),
        ],
      ),
    );
  }
}
