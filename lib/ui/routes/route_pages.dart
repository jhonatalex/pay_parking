import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_binding.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:pay_parking/ui/pages/home/home_binding.dart';
import 'package:pay_parking/ui/pages/login/login_binding.dart';
import 'package:pay_parking/ui/pages/login/login_page.dart';
import 'package:pay_parking/ui/pages/open_barrier/open_barrier_page.dart';

import 'package:pay_parking/ui/pages/register/register_binding.dart';
import 'package:pay_parking/ui/pages/register/register_page.dart';
import 'package:pay_parking/ui/pages/verify_email/verify_email_binding.dart';
import 'package:pay_parking/ui/pages/verify_email/verify_email_page.dart';

import '../pages/home/home_page.dart';

import '../pages/intro_main/intro_binding.dart';
import '../pages/intro_main/intro_screen_page.dart';
import '../pages/profile/profile_binding.dart';
import '../pages/profile/profile_page.dart';
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
        //transition: Transition.circularReveal,
        binding: const HomeBinding(),
      ),
      GetPage(
        name: RouteNames.signIn,
        page: () => const LoginPage(),
        transition: Transition.fade,
        binding: const LoginBinding(),
      ),
      GetPage(
        name: RouteNames.intro,
        page: () => const IntroScreen(),
        transition: Transition.cupertino,
        binding: const IntroBinding(),
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
            const ForgotPasswordPage(),
        transition: Transition.cupertino,
        binding: const ForgotPasswordBinding(),
      ),
      GetPage(
        name: RouteNames.verifyEmail,
        page: () => //const
            const VerifyEmailPage(),
        transition: Transition.cupertino,
        binding: const VerifyEmailBinding(),
      ),
      GetPage(
        name: RouteNames.profile,
        page: () => //const
            const ProfilePage(),
        transition: Transition.cupertino,
        binding: const ProfileBinding(),
      ),
      GetPage(
        name: RouteNames.openBarrier,
        page: () => //const
            const OpenBarrierPage(),
        transition: Transition.cupertino,
        // binding: const OpenBarrierBinding(),
      ),
    ];
  }
}
