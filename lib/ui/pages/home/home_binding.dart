import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/my_user_controller.dart';
import 'package:pay_parking/ui/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  const HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyUserController>(() => MyUserController());
  }
}
