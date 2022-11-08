import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/widgets/background.dart';

import 'package:pay_parking/ui/widgets/card_transparent.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isGoogleSignIn = false;
  String errorMessage = '';
  String successMessage = '';
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

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
        const CardContainer(),
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
                const SizedBox(),
                //CAMPO DE CONTRASEÑA
                PasswordField("Contraseña", passwordController),
                const SizedBox(),
                //BOTON DE
                ButtonSingIn("Ingresar", emailController, passwordController,
                    const Home()),
                const Divider(
                  height: 15,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text("Olvidó su contraseña ",
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
