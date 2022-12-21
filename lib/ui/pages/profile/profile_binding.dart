import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';

import '../../../app/controllers/my_user_controller.dart';

class ProfileBinding implements Bindings {
  const ProfileBinding();

  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<MyUserController>(() => MyUserController());
  }
}
