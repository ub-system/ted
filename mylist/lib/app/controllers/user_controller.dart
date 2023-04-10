import 'package:get/get.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserController extends GetxController {
  final repository = UserRepository();

  RxList<UserModel> listCategories = RxList<UserModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;
    List<UserModel> result = await repository.getAll();
    if (result.isNotEmpty) {
      listCategories.assignAll(result);
    } else {
      print("Erro ao retornar os dados");
    }
    isLoading.value = false;
  }
}
