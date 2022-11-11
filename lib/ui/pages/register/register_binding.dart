import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';

class RegisterBinding implements Bindings {
  const RegisterBinding();

  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
