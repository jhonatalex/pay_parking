import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_controller.dart';

class LoginMainBinding implements Bindings {
  const LoginMainBinding();

  @override
  void dependencies() {
    Get.lazyPut<LoginMainController>(() => LoginMainController());
  }
}
