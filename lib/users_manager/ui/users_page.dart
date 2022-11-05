import 'package:ceiba/themes/themes.dart';
import 'package:ceiba/users_manager/controllers/user_manager_provider.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:ceiba/users_manager/ui/components/user_list_item_component.dart';
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
        title: const Text("Prueba de ingreso"),
      ),
      body: Column(
        children: [
          //Search bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: (value) => userManagerProvider.searchUserByName(value),
            ),
          ),
          //User list
          Expanded(
            child: userManagerProvider.usersDisplayList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemCount: userManagerProvider.usersDisplayList.length,
                    itemBuilder: (_, index) {
                      User user = userManagerProvider.usersDisplayList[index];
                      return ListItem(user: user);
                    }),
          ),
        ],
      ),
    );
  }
}
