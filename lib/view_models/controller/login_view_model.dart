import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/repository/login_repository/login_repository.dart';
import 'package:mvvm_mvc_with_getx/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

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
      }
    }).onError((e, stackTrace) {
      loading.value = false;
      debugPrint("error in Login function :- ${e.toString()}");
      Utils.snackBar("Error:", e.toString());
    });
  }
}
