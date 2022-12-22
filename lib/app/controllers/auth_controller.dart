import 'dart:async';

import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_repositoryAbst.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

enum AuthState {
  signedOUT,
  signedIN,
}

class AuthController extends GetxController {
  //final Rx<AuthUser?> authUser = Rx(null);

  final _authRepository = Get.find<AuthRepository>();
  late StreamSubscription _authSubscription;

  final Rx<AuthState> authState = Rx(AuthState.signedOUT);
  final Rx<AuthUser?> authUser = Rx(null);

  @override
  void onInit() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    await Future.delayed(const Duration(seconds: 3));
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
    super.onInit();
  }

  void _authStateChanged(AuthUser? user) {
    //VERIFICA EL USUARIO PARA MANDARLO A LA PANTALLA CORRECTA Y SET THE STATE
    if (user == null) {
      authState.value = AuthState.signedOUT;
      Get.offAllNamed(RouteNames.intro);
    } else {
      authState.value = AuthState.signedIN;
      Get.offAllNamed(RouteNames.home);
    }
    authUser.value = user;
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  @override
  void onClose() {
    _authSubscription.cancel();
    super.onClose();
  }

/*
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) Get.offAllNamed(RouteNames.signIn);

      authUser.value = user as AuthUser?;
    });
  }

  //User? get currentUser => FirebaseAuth.instance.currentUser;
*/

}
