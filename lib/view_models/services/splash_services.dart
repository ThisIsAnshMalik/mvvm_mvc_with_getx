import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/res/routes/routes_name.dart';
import 'package:mvvm_mvc_with_getx/view_models/controller/user_preference/user_prefernce_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then(
      (value) {
        print(value.token);
        if (value.token!.isEmpty || value.token.toString() == 'null') {
          Timer(const Duration(seconds: 3), (() {
            Get.toNamed(RouteName.loginView);
          }));
        } else {
          Timer(const Duration(seconds: 3), (() {
            Get.toNamed(RouteName.homeView);
          }));
        }
      },
    );
  }
}
