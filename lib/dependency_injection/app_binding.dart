import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/app_controller.dart';

import '../app/controllers/auth_controller.dart';
import '../app/controllers/google_controller.dart';
import '../data/login_firebase/auth_repositoryImp.dart';
import '../data/login_firebase/auth_repositoryAbst.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepositoryImp(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AppController>(AppController(), permanent: true);
    Get.put<GoogleSignInController>(GoogleSignInController(), permanent: true);
  }
}
