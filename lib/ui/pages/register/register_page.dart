import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_name_field.dart';
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
  final confirmPasswordController = TextEditingController();

  bool isChecked = false;

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
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final cardLogin = Stack(
      children: [
        const CardContainer(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        logo,
                        const Text("   Registro de \n Usuario",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),

                    const Text("Rellena el formulario para crear tu cuenta",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                    const SizedBox(
                      height: 10,
                    ),
                    //BOTONES
                    InputTextField("Nombre", const Icon(Icons.person)),
                    // CAMPO DE EMAIL
                    EmailField(
                        "Correo Electrónico", controller.emailController),

                    InputTextField("Rut", const Icon(Icons.numbers)),
                    InputTextField("Teléfono", const Icon(Icons.phone)),
                    //CAMPO DE CONTRASEÑA
                    PasswordField("Contraseña", controller.passwordController),
                    PasswordField(
                        "Confirmar Contraseña", confirmPasswordController),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                          ),
                          const Text(
                            "Acepto los ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Términos y Condiciones",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFDF40)),
                          ),
                        ],
                      ),
                    ),
                    //BOTON DE REGISTRO
                    Container(
                        margin: const EdgeInsets.only(top: 0.0),
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
                              child: const Center(
                                child: Text("Registrame",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
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
                            const Text("¿Ya estás registrado?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                      ],
                    ),
                    /* TextButton(
                        onPressed: () {
                          Get.offNamed(RouteNames.signIn);
                        },
                        child: const Text("ver pagina verify email",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold))),*/
                  ]),
            ],
          ),
        )
      ],
    );

    return Scaffold(
        body: Stack(
      children: [const Background(), cardLogin],
    ));
  }
}
