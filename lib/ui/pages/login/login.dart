import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/widgets/background.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';

import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/button_with_background.dart';

import '../../widgets/button_sing_in.dart';
import '../../widgets/input_email_field.dart';
import '../../widgets/input_password_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                Flexible(
                  fit: FlexFit.tight,
                  child: logo,
                ),

                //BOTONES
                // CAMPO DE EMAIL
                EmailField("Correo Electrónico", emailController),
                SizedBox(),
                //CAMPO DE CONTRASEÑA
                PasswordField("Contraseña", passwordController),
                SizedBox(),
                //BOTON DE
                ButtonSingIn(
                    "Ingresar", emailController, passwordController, Home()),
                Divider(
                  height: 15,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Olvidó su contraseña ",
                        style: TextStyle(color: Colors.black))),
              ]),
        )
      ],
    ));

    return Material(
        child: Stack(
      children: [Background(), card_login],
    ));
  }
}
