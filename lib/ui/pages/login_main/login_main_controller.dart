import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/login_firebase/auth_firebase.dart';
import '../../routes/route_names.dart';
import '../../widgets/error_snackbar.dart';

class LoginMainController extends GetxController {
  void goToLogin() {
    Get.offNamed(RouteNames.signIn); //ASI SE NAVEGA CON GETX
  }

  void goToRegister() {
    Get.offNamed(RouteNames.register); //ASI SE NAVEGA CON GETX
  }

  //GOOGLE
  Future<void> sinInWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await const AuthFirebase().signInGoogle(googleAuth);

          Get.showSnackbar(ErrorSnackbar("FF"));
          Get.offNamed(RouteNames.home);

          /*DATA USER EN BASE DE DATOS
          if (authResult.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(authResult.user!.uid)
                .set({
              'id': authResult.user!.uid,
              'name': authResult.user!.displayName,
              'email': authResult.user!.email,
              'shipping-address': '',
              'userWish': [],
              'userCart': [],
              'createdAt': Timestamp.now(),
            });
          }
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const FetchScreen(),
            ),
          );

          */
        } on FirebaseException catch (e) {
          Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
        } catch (error) {
          Get.showSnackbar(ErrorSnackbar("error"));
        } finally {}
      }
    }
  }
}
