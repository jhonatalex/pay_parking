import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

                //BOTON DE INICIO DE SESSION
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 220.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFFFDF40)),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            // if (_formStateKey.currentState?.validate()) {

                            //_formStateKey.currentState?.save();

                            signIn("uno@dos.com", "password").then((user) {
                              if (user != null) {
                                print('Logged in successfully.');
                                setState(() {
                                  successMessage =
                                      'Logged in successfully.\nYou can now navigate to Home Page.';
                                });
                              } else {
                                print('Error while Login.');
                              }
                            });
                            // }

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

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(userCredential);

      return userCredential;
    } catch (i) {
      //handleError(i);
      return null;
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_USER_NOT_FOUND':
        setState(() {
          errorMessage = 'User Not Found!!!';
        });
        break;
      case 'ERROR_WRONG_PASSWORD':
        setState(() {
          errorMessage = 'Wrong Password!!!';
        });
        break;
    }
  }

/*
  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email Id!!!';
    else {
      return null;
    }
  }

  */

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password is empty!!!';
    }
    return null;
  }
}
