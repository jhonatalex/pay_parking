import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_parking/ui/pages/login/login_page.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_page.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_password_field.dart';

import '../../widgets/Background.dart';
import '../../widgets/card_transparent.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
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
    final RegisterController controller = Get.find<RegisterController>();
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
                SizedBox(
                  height: 10,
                ),
                const Text("Bienvenido",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                const Text("Rellena el formulario para crear tu cuenta",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                //BOTONES
                // CAMPO DE EMAIL
                EmailField("Correo Electrónico", controller.emailController),
                const SizedBox(),
                //CAMPO DE CONTRASEÑA
                PasswordField("Contraseña", controller.passwordController),
                const SizedBox(),
                //BOTON DE
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 220.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0xFFFFDF40)),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            controller.singUp();

                            /* Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));*/
                          },
                          child: Center(
                            child: Text("Registrame",
                                style: const TextStyle(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ya estás registrado?"),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(RouteNames.signIn);
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
