import 'package:ceiba/users_manager/controllers/user_manager_provider.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

 
  @override
  Widget build(BuildContext context) {
    UserManagerProvider userManagerProvider = Provider.of<UserManagerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ceiba users"),
      ),
      body: ListView.builder(
          itemCount: userManagerProvider.usersDisplayList.length,
          itemBuilder: (_, index) {
            User user = userManagerProvider.usersDisplayList[index];
            return Text(user.name);
          }),
    );
  }
}
