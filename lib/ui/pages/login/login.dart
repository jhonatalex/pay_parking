import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/widgets/background.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';

import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/button_with_background.dart';

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

                //BOTON DE INICIO SESSION
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 220.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFFFDF40)),
                    child: Center(
                      child: TextButton(
                          onPressed: () async {
                            try {
                              String trimmedEmail = emailController.text.trim();
                              String trimmedPassword =
                                  passwordController.text.trim();

                              //try to sign in
                              UserCredential? userCred = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: trimmedEmail,
                                      password: trimmedPassword);

                              if (userCred.user!.emailVerified) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                            } on FirebaseAuthException catch (e) {
                              log(e.toString());

                              if (e.code == 'invalid-email') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Email address is invalid'),
                                    action: SnackBarAction(
                                      label: 'Action',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                  ),
                                );
                              }

                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Please Register'),
                                    action: SnackBarAction(
                                      label: 'Action',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                  ),
                                );
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Invalid Passwordd'),
                                    action: SnackBarAction(
                                      label: 'Action',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              log(e.toString());
                            }
                            /* Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => page));*/
                          },
                          child: const Center(
                            child: Text("Ingresar",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )),
                    )),
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
