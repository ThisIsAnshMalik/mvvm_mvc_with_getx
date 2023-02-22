import 'package:flutter/material.dart';
import 'package:mvvm_mvc_with_getx/res/Colors/app_colors.dart';
import 'package:mvvm_mvc_with_getx/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.blackColor,
        ),
      ),
    );
  }
}
