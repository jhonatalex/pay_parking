import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/input_with_icons_less_background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/button_with_background.dart';
import 'package:pay_parking/ui/widgets/gradient_back.dart';

class Login1 extends StatelessWidget {
  const Login1({Key? key}) : super(key: key);

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
        Container(
          margin: const EdgeInsets.only(top: 70.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo,
                Input1IconLessBackground(
                    Icon(Icons.email), "Correo Electrónico"),
                Input2IconsLessBackground(Icon(Icons.lock_outline),
                    "Contraseña", Icon(Icons.visibility_off)),
                ButtonWithBackground("Ingresar"),
                Divider(
                  height: 30,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
                TextButton(
                    onPressed: () {}, child: Text("Olvidó su contraseña"))
              ]),
        )
      ],
    ));

    return Stack(
      children: [GradientBack(""), card_login],
    );
  }
}
