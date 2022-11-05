import 'package:ceiba/themes/themes.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final User user;
  const ListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                user.name,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, color: primaryColor),
                      Text(user.phone),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail, color: primaryColor),
                      Text(user.email),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("VER PUBLICACIONES"),
            ),
          )
        ],
      ),
    );
  }
}
