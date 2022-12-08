import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_name_field.dart';
import 'package:pay_parking/ui/widgets/input_password_field.dart';

import '../../../app/controllers/my_user_controller.dart';
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
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final imageObx = Obx(() {
      Widget image = Image.asset(
        'assets/blank-profile.png',
        fit: BoxFit.fill,
      );

      if (userController.pickedImage.value != null) {
        image = Image.file(
          userController.pickedImage.value!,
          fit: BoxFit.fill,
        );
      } else if (userController.user.value?.image?.isNotEmpty == true) {
        image = CachedNetworkImage(
          imageUrl: userController.user.value!.image!,
          progressIndicatorBuilder: (_, __, progress) =>
              CircularProgressIndicator(value: progress.progress),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          fit: BoxFit.fill,
        );
      }
      return image;
    });

    final cardLogin = Center(
      child: Stack(
        children: [
          const CardContainer(),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: logo,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Bienvenido",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                const Text("Rellena el formulario para crear tu cuenta",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                const SizedBox(
                  height: 10,
                ),

                //IMAGEN PIKER

                GestureDetector(
                  onTap: () async {
                    final pickedImage =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      Get.find<MyUserController>()
                          .setImage(File(pickedImage.path));
                    }
                  },
                  child: Center(
                    child: ClipOval(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: imageObx,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
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
                            onPressed: () {},
                            child: const Center(
                              child: Text("Registrame",
                                  style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )))),
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
              ]),
        ],
      ),
    );

    return Scaffold(
        body: Stack(
      children: [const Background(), cardLogin],
    ));
  }
}
