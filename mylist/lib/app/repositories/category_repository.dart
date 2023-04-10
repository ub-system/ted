import 'package:mylist/app/services/http_manager.dart';

import '../models/category_model.dart';

class CategoryRepository {
  HttpManager httpManager = HttpManager();

  Future<List<CategoryModel>> getAll() async {
    final response = await httpManager.request(
      url: "https://ilearn.appke.com.br/api/categories",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<CategoryModel> categoryList = CategoryModel.fromList(list);

      return categoryList;
    } else {
      return [];
    }
  }
}
