import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  const ForgotPasswordBinding();

  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
