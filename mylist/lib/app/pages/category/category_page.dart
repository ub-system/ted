import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    controller.getCategories();
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
                controller.listCategories[index].name,
              ))),
              itemCount: controller.listCategories.length,
            );
          }
        }));
  }
}