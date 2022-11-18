import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_binding.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:pay_parking/ui/pages/home/home_binding.dart';
import 'package:pay_parking/ui/pages/login/login_binding.dart';
import 'package:pay_parking/ui/pages/login/login_page.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_binding.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_page.dart';
import 'package:pay_parking/ui/pages/register/register_binding.dart';
import 'package:pay_parking/ui/pages/register/register_page.dart';

import '../pages/home/home_page.dart';
import '../pages/splash/splash_binding.dart';
import '../pages/splash/splash_page.dart';
import 'route_names.dart';

class RoutePages {
  const RoutePages._();

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashPage(),
        binding: const SplashBinding(),
      ),
      GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
        transition: Transition.circularReveal,
        binding: const HomeBinding(),
      ),
      GetPage(
        name: RouteNames.signIn,
        page: () => const LoginPage(),
        transition: Transition.fade,
        binding: const LoginBinding(),
      ),
      GetPage(
        name: RouteNames.loginMain,
        page: () => const LoginMainPage(),
        transition: Transition.cupertino,
        binding: const LoginMainBinding(),
      ),
      GetPage(
        name: RouteNames.register,
        page: () => const RegisterPage(),
        transition: Transition.cupertino,
        binding: const RegisterBinding(),
      ),
      GetPage(
        name: RouteNames.forgotPassword,
        page: () => //const
            ForgotPasswordPage(),
        transition: Transition.cupertino,
        binding: const ForgotPasswordBinding(),
      ),
    ];
  }
}
