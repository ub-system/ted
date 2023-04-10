import 'package:get/get.dart';

import '../models/category_model.dart';
import '../repositories/category_repository.dart';

class CategoryController extends GetxController {
  final repository = CategoryRepository();

  RxList<CategoryModel> listCategories = RxList<CategoryModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;
    List<CategoryModel> result = await repository.getAll();
   
    isLoading.value = false;
    return result;
  }
}
