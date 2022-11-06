import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/login/login.dart';
import 'package:pay_parking/ui/pages/login_main/login_main.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_password_field.dart';

import '../../widgets/Background.dart';
import '../../widgets/card_transparent.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

    final cardLogin = Center(
        child: Stack(
      children: [
        const CardContainer(),
        Container(
          margin: const EdgeInsets.only(top: 70.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
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
                ButtonSingUp("Registrarse", emailController, passwordController,
                    const LoginMain()),
                const Divider(
                  height: 15,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ya estás registrado?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text("Inicia Sesión",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ]),
        )
      ],
    ));

    return Scaffold(
        body: Stack(
      children: [Background(), cardLogin],
    ));
  }
}

class ButtonSingUp extends StatelessWidget {
  String textButton = "";
  Widget page;
  TextEditingController email_user;
  TextEditingController password_user;
  ButtonSingUp(
    this.textButton,
    this.email_user,
    this.password_user,
    this.page,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color(0xFFFFDF40)),
        child: Center(
          child: TextButton(
              onPressed: () {
                singUp();

                /* Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));*/
              },
              child: Center(
                child: Text(textButton,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )),
        ));
  }

  Future singUp() async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email_user.text, password: password_user.text);

    debugPrint('movieTitle: $result');
  }
}
