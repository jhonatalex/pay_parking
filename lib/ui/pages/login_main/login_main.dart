import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/button_less_background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import '../../widgets/button_with_background.dart';
import '../../widgets/gradient_back.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final card_login = Center(
        child: Stack(
      children: [
        CardContainer(),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo,
              ButtonWithBackground("Ingresar"),
              ButtonLessBackground("Crear Cuenta")
            ])
      ],
    ));

    return Stack(
      children: [GradientBack("Login"), card_login],
    );
  }
}
