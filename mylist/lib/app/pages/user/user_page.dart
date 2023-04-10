import 'package:flutter/material.dart';
import 'package:mylist/app/models/user_model.dart';
import 'package:mylist/app/controllers/user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  List<UserModel> _listUser = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await UserController().getUsers();
    setState(() {
      _listUser = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: _listUser.isNotEmpty ? 
       ListView.builder(
        itemCount: _listUser.length,
        itemBuilder: (BuildContext context, int index) {
          final user = _listUser[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            // ...
          );
        },
      ) : 
      const Center(child: CircularProgressIndicator())
    );
  }
}
