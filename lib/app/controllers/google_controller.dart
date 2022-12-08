import 'dart:async';

import 'package:get/get.dart';

import '../../data/login_firebase/auth_repositoryAbst.dart';

class GoogleSignInController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);

  Future<void> signInGoogleController() =>
      _signIn(_authRepository.signInGoogle);

  Future<void> _signIn(Future<AuthUser?> Function() auxUser) async {
    try {
      isLoading.value = true;
      error.value = null;
      await auxUser();
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
