import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';

import '../../widgets/Background.dart';
import '../../widgets/card_transparent.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.find<ForgotPasswordController>();
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
                const Text("Recuperar contraseña",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                const Text("Recibe un correo para resetear tu contraseña",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                //BOTONES
                // CAMPO DE EMAIL
                EmailField("Correo Electrónico", controller.emailController),
                const SizedBox(),
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
                            controller.resetPassword();

                            /* Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));*/
                          },
                          child: Center(
                            child: Text("Enviar correo",
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
                    Text("¿Recuerdas la contraseña?"),
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
