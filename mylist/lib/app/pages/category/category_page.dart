import 'package:flutter/material.dart';
import 'package:mylist/app/controllers/category_controller.dart';
import 'package:mylist/app/models/category_model.dart';

class CategoryPage extends StatefulWidget{
  const CategoryPage({super.key});

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> _listCategory = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final categories = await CategoryController().getCategories();
    setState(() {
      _listCategory = categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Categorias'),
      ),
      body: _listCategory.isNotEmpty ? 
       ListView.builder(
        itemCount: _listCategory.length,
        itemBuilder: (BuildContext context, int index) {
          final category = _listCategory[index];
          return ListTile(
            title: Text(category.name)
            // ...
          );
        },
      ) : 
      const Center(child: CircularProgressIndicator())
    );
  }
}