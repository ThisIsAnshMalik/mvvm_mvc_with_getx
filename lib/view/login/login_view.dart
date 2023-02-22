import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/res/components/round_button.dart';
import 'package:mvvm_mvc_with_getx/utils/utils.dart';
import 'package:mvvm_mvc_with_getx/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: loginVM.emailController.value,
                  focusNode: loginVM.emailFocusNode.value,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'email_hint'.tr),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        loginVM.emailFocusNode.value,
                        loginVM.passwordFocusNode.value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("error", "Please enter email");
                    }
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                TextFormField(
                  controller: loginVM.passwordController.value,
                  focusNode: loginVM.passwordFocusNode.value,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'password_hint'.tr),
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("error", "Please enter password");
                    }
                  },
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx((() {
                  return RoundeButton(
                      loading: loginVM.loading.value,
                      width: Get.width * 0.4,
                      title: "login".tr,
                      onPress: (() {
                        if (_formKey.currentState!.validate()) {
                          loginVM.login();
                        }
                      }));
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
