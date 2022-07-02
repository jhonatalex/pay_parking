import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/background.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';

import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/button_with_background.dart';

import '../../widgets/input_email_field.dart';
import '../../widgets/input_password_field.dart';

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
        Container(
          margin: const EdgeInsets.only(top: 70.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo,
                //ButtonBlueWithIcon(Icons.bluetooth_audio, "ABRIR BARRERA"),
                EmailField("Correo Electrónico"),
                SizedBox(),
                PasswordField("Contraseña"),
                SizedBox(),
                ButtonWithBackground("Ingresar"),
                Divider(
                  height: 30,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Olvidó su contraseña",
                        style: TextStyle(color: Colors.black))),
              ]),
        )
      ],
    ));

    return Stack(
      children: [Background(), card_login],
    );
  }
}
