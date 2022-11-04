import 'dart:io';

import 'package:ceiba/users_manager/repository/models/post_model.dart';
import 'package:ceiba/users_manager/repository/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ceiba/providers.dart';
import 'package:ceiba/users_manager/controllers/user_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ceiba/users_manager/ui/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(PostAdapter());
    Box<User> users = await Hive.openBox<User>("users");

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersList,
      child: MaterialApp(
        title: 'Ceiba challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FutureBuilder(
          future: initDatabase(),
          builder: (_, snap) {
            if (snap.data != null) {
              return const UsersPage();
            } else {
              return Scaffold(
                backgroundColor: Colors.green,
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("starting database"),
                  ],
                )),
              );
            }
          },
        ),
      ),
    );
  }
}
