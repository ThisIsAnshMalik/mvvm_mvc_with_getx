import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/res/routes/routes_name.dart';
import 'package:mvvm_mvc_with_getx/view/home/home_view.dart';
import 'package:mvvm_mvc_with_getx/view/login/login_view.dart';
import 'package:mvvm_mvc_with_getx/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: (() => const SplashScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.loginView,
            page: (() => const LoginView()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.homeView,
            page: (() => const HomeView()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
