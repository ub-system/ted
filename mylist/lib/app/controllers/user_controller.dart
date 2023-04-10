import 'package:get/get.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserController extends GetxController {
  final repository = UserRepository();

  RxList<UserModel> listUsers = RxList<UserModel>([]);
  RxBool isLoading = false.obs;

  Future getUsers() async {
    isLoading.value = true;
    List<UserModel> result = await repository.getAll();
    
    isLoading.value = false;
    return result;
  }
}
