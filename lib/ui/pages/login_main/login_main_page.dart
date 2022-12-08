import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_controller.dart';
import 'package:pay_parking/ui/widgets/Background.dart';
import 'package:pay_parking/ui/widgets/button_less_background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import '../../widgets/button_with_background2.dart';

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
      margin: const EdgeInsets.only(top: 10.0),
      width: 220.0,
      height: 45.0,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: const Text("Iniciar con Google",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            child: Image.asset(
              "assets/img/google.png",
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                color: Colors.transparent,
              ))
        ],
      ),
    );

    final cardLogin = Center(
        child: Stack(
      children: [
        const CardContainer(),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(child: logo),
                const SizedBox(height: 40),
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
        )
      ],
    ));

    return Scaffold(
      body: Stack(
        children: [BackgroundImagen("assets/img/fondo-home.jpg"), cardLogin],
      ),
    );
  }
}
