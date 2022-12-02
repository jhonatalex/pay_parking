import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_controller.dart';
import 'package:pay_parking/ui/widgets/Background.dart';
import 'package:pay_parking/ui/widgets/button_less_background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import '../../widgets/button_with_background2.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginMainController controller = Get.find<LoginMainController>();

    final logo = Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final logoRss = Container(
        padding: const EdgeInsets.only(top: 8.0),
        width: 150,
        child: Row(children: [
          Container(
            width: 37,
            height: 37,
            margin: const EdgeInsets.only(right: 10.0),
            color: const Color.fromARGB(255, 80, 80, 80),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(FontAwesomeIcons.google),
              onPressed: () {
                controller.sinInWithGoogle();
              },
            ),
          ),
          SignInButton(Buttons.Facebook, mini: true, onPressed: () {}),
          SignInButton(Buttons.Email, mini: true, onPressed: () {})
        ]));

    final cardLogin = Center(
        child: Stack(
      children: [
        const CardContainer(),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: logo),
                  ButtonWithBackground2("Ingresar"),
                  ButtonLessBackground("Crear Cuenta"),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: const Text("___________ O ingrese con __________",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  logoRss
                ]),
          ),
        )
      ],
    ));

    return Scaffold(
      body: Stack(
        children: [const Background(), cardLogin],
      ),
    );
  }
}
