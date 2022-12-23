import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/domain/repositories/abstractas/responsive.dart';
import 'package:pay_parking/ui/pages/register/register_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/Background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/input_city_field.dart';
import 'package:pay_parking/ui/widgets/input_name_field.dart';
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
        Column(children: <Widget>[
          const AppBarBack(title: 'Mi Perfil', route: RouteNames.home),
          SizedBox(
            height: sclH(context) * 4,
          ),

          //IMAGEN PIKER
          GestureDetector(
            onTap: () async {
              final pickedImage =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                Get.find<MyUserController>().setImage(File(pickedImage.path));
              }
            },
            child: Center(
              child: ClipOval(
                child: SizedBox(
                  width: sclH(context) * 18,
                  height: sclH(context) * 18,
                  child: imageObx,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Completa Tus Datos",
              style:
                  TextStyle(color: Colors.black, fontSize: sclW(context) * 4)),

          const SizedBox(),
          //BOTONES
          // CAMPO DE NOMBRE
          Container(
            height: sclH(context) * 50,
            width: sclW(context) * 65,
            child: ListView(
              children: [
                InputNameField("Nombre", userController.nameController),
                // CAMPO DE RUT
                RutField("Rut", userController.rutController),

                // CAMPO DE TELEFONO
                PhonoField("Telefono", userController.phoneController),

                //CAMPO DE CIUDAD
                CityField("Ciudad", userController.cityController),
                const SizedBox(
                  height: 10,
                ), //BOTON DE
                Obx(() {
                  final isSaving = userController.isSaving.value;
                  return Stack(alignment: Alignment.center, children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: sclW(context) * 25,
                        height: sclW(context) * 25 / 2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xFFFFDF40)),
                        child: Center(
                          child: TextButton(
                              onPressed: isSaving
                                  ? null
                                  : () => userController.saveMyUser(),
                              child: Center(
                                child: Text("Guardar",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: sclW(context) * 5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )),
                        )),
                    if (isSaving) const CircularProgressIndicator()
                  ]);
                }),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
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
    ));

    return Scaffold(
        body: Stack(
      children: [
        const Background(),
        cardLogin,
      ],
    ));
  }
}
