import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/Background.dart';
import 'package:pay_parking/ui/widgets/app_bar.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/input_city_field.dart';
import 'package:pay_parking/ui/widgets/input_email_field.dart';
import 'package:pay_parking/ui/widgets/input_name_field.dart';
import 'package:pay_parking/ui/widgets/input_password_field.dart';
import 'package:pay_parking/ui/widgets/input_phone_field.dart';
import 'package:pay_parking/ui/widgets/input_rut_field.dart';

import '../../../../app/controllers/my_user_controller.dart';
import '../../widgets/app_bar_back.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _profileState();
}

class _profileState extends State<ProfilePage> {
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

    final userController = Get.find<MyUserController>();

    final picker = ImagePicker();

    final imageObx = Obx(() {
      Widget image = Image.asset(
        'assets/img/blank-profile.png',
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
        Flexible(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Flexible(
                  child: SizedBox(
                    height: 80,
                  ),
                ),
                const Flexible(
                  child: Text("Mi Perfil",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),

                const SizedBox(
                  height: 5,
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
                        width: 120,
                        height: 120,
                        child: imageObx,
                      ),
                    ),
                  ),
                ),

                const Flexible(child: SizedBox(height: 30)),

                const Text("Completa Tus Datos",
                    style: TextStyle(color: Colors.black, fontSize: 14)),

                const SizedBox(),
                //BOTONES
                // CAMPO DE NOMBRE
                InputNameField("Nombre", userController.nameController),

                // CAMPO DE RUT
                RutField("Rut", userController.rutController),

                // CAMPO DE TELEFONO
                PhonoField("Telefono", userController.phoneController),

                //CAMPO DE CIUDAD
                CityField("Ciudad", userController.cityController),
                const SizedBox(
                  height: 10,
                ),

                //BOTON DE
                Flexible(
                  child: Obx(() {
                    final isSaving = userController.isSaving.value;
                    return Stack(alignment: Alignment.center, children: [
                      Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          width: 220.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xFFFFDF40)),
                          child: Center(
                            child: TextButton(
                                onPressed: isSaving
                                    ? null
                                    : () => userController.saveMyUser(),
                                child: const Center(
                                  child: Text("Guardar",
                                      style: TextStyle(
                                          fontFamily: "Lato",
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )),
                          )),
                      if (isSaving) const CircularProgressIndicator()
                    ]);
                  }),
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
        )
      ],
    ));

    return Scaffold(
        appBar: appBarBack,
        body: Stack(
          children: [const Background(), Flexible(child: cardLogin)],
        ));
  }
}
