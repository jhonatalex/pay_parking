import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/verify_email/verify_email_controller.dart';

class VerifyEmailBinding implements Bindings {
  const VerifyEmailBinding();

  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailController>(() => VerifyEmailController());
  }
}
