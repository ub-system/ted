import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mylist/app/controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    controller.getUsers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Categorias'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: Text(
                        controller.listUsers[index].name,
                      ),
                      subtitle: Text(
                        controller.listUsers[index].email,
                      ),
                  )
                ),
              itemCount: controller.listUsers.length,
            );
          }
        })
      );
  }
}
