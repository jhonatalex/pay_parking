import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/login/login_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/background.dart';

import 'package:pay_parking/ui/widgets/card_transparent.dart';

import '../../../domain/repositories/abstractas/responsive.dart';
import '../../widgets/input_email_field.dart';
import '../../widgets/input_password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isGoogleSignIn = false;
  String errorMessage = '';
  String successMessage = '';

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    final logo = Container(
        width: sclH(context) * 20,
        height: sclH(context) * 20,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final cardLogin = Stack(
      children: [
        const CardContainer(),
        Column(

            //padding: EdgeInsets.symmetric(horizontal: 90.0),
            // child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                //fit: FlexFit.tight, esto da error en una pantalla mas grade
                child: logo,
              ),
              const SizedBox(height: 10),
              Text(
                "Iniciar Sesión",
                style: TextStyle(
                    fontFamily: "raleway", fontSize: sclW(context) * 4),
              ),
              //BOTONES
              // CAMPO DE EMAIL
              EmailField("Correo Electrónico", controller.emailController),
              const SizedBox(),
              //CAMPO DE CONTRASEÑA
              PasswordField("Contraseña", controller.passwordController),
              const SizedBox(),

              //BOTON DE INICIO DE SESSION
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: sclW(context) * 35,
                  height: sclH(context) * 35 / 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFFFFDF40)),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          controller.signIn();

                          /* Navigator.push(                                  context, MaterialPageRoute(builder: (context) => page));*/
                        },
                        child: Center(
                          child: Text("Ingresar",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: sclH(context) * 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Divider(
                  height: 15,
                  thickness: 1,
                  indent: 130,
                  endIndent: 130,
                  color: Colors.black,
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.offNamed(RouteNames.forgotPassword);
                    },
                    child: Text("¿Olvidó su contraseña?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: sclH(context) * 2,
                        ))),
              ),

              //Solo para navegar porque el botton back no funciona
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.offNamed(RouteNames.register);
                      },
                      child: Text("Resgistrarse",
                          style: TextStyle(
                              fontSize: sclH(context) * 2,
                              color: const Color(0xFFFFDF40),
                              fontWeight: FontWeight.bold))),
                  /*  TextButton(
                      onPressed: () {
                        Get.offNamed(RouteNames.loginMain);
                      },
                      child: const Text("Volver",
                          style: TextStyle(
                              color: Color(0xFFFFDF40),
                              fontWeight: FontWeight.bold))),*/
                ],
              ),
            ])
      ],
    );

    return Scaffold(
        body: Stack(
      children: [const Background(), Flexible(child: cardLogin)],
    ));
  }
}
