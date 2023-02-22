import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mvvm_mvc_with_getx/models/login/user_model.dart';
import 'package:mvvm_mvc_with_getx/repository/login_repository/login_repository.dart';
import 'package:mvvm_mvc_with_getx/res/routes/routes.dart';
import 'package:mvvm_mvc_with_getx/res/routes/routes_name.dart';
import 'package:mvvm_mvc_with_getx/utils/utils.dart';
import 'package:mvvm_mvc_with_getx/view_models/controller/user_preference/user_prefernce_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void login() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      debugPrint("value ==> ${value.toString()}");
      if (value['error'] == "user not found") {
        loading.value = false;
        Utils.snackBar("Login", "login failed ${value['error']}");
      } else {
        loading.value = false;
        Utils.snackBar("Login", "login successfully");
        userPreference.saveUser(UserModel.fromJson(value)).then((value) {
          Get.toNamed(RouteName.homeView);
        }).onError((error, stackTrace) {
          Utils.snackBar("Login", error.toString());
        });
      }
    }).onError((e, stackTrace) {
      loading.value = false;
      debugPrint("error in Login function :- ${e.toString()}");
      Utils.snackBar("Error:", e.toString());
    });
  }
}
