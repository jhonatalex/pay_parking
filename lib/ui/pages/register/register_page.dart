import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_password_field.dart';

import '../../../app/controllers/my_user_controller.dart';
import '../../../domain/repositories/abstractas/responsive.dart';
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

    final userController = Get.find<MyUserController>();

    final picker = ImagePicker();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: logo,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Bienvenido",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: sclH(context) * 3)),
              Text("Ingresa un Correo y Contraseña para crear tu cuenta",
                  style: TextStyle(
                      color: Colors.black, fontSize: sclH(context) * 1.8)),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(height: 8),
              //BOTONES
              // CAMPO DE EMAIL
              EmailField("Correo Electrónico", controller.emailController),
              const SizedBox(),
              //CAMPO DE CONTRASEÑA
              PasswordField("Contraseña", controller.passwordController),
              const SizedBox(),
              //CAMPO DE CONTRASEÑA
              PasswordField(
                  "Repetir Contraseña", controller.passwordController),
              const SizedBox(),

              //BOTON DE
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
                          controller.singUp();

                          ///userController.saveMyUser();
                          /* Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));*/
                        },
                        child: Center(
                          child: Text("Registrame",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: sclH(context) * 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                  )),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿Ya estás registrado?",
                    style: TextStyle(
                      fontSize: sclH(context) * 2,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(RouteNames.signIn);
                      },
                      child: Text("Inicia Sesión",
                          style: TextStyle(
                              fontSize: sclH(context) * 2,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold))),
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
            ])
      ],
    );

    return Scaffold(
        body: Stack(
      children: [const Background(), cardLogin],
    ));
  }
}
