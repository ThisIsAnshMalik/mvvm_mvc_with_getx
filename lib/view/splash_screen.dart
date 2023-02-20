import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/data/app_exception.dart';
import 'package:mvvm_mvc_with_getx/res/components/general_exception_widget.dart';
import 'package:mvvm_mvc_with_getx/res/components/internet_exception_widget.dart';
import 'package:mvvm_mvc_with_getx/res/components/round_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('email_hint'.tr)),
        body: RoundeButton(title: "helo", onPress: (() {})));
  }
}
