import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/app/controllers/auth_controller.dart';
import 'package:pay_parking/ui/pages/home/home_page.dart';
import 'package:pay_parking/ui/pages/login/login_page.dart';

import 'package:pay_parking/ui/pages/open_barrier/open_barrier_page.dart';
import 'package:pay_parking/ui/pages/register/register_page.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

import '../../app/controllers/my_user_controller.dart';
import '../pages/intro_main/intro_screen_page.dart';
import '../pages/register/register_controller.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    final drawerHeader = Stack(
      children: [
        InkWell(
            onTap: () {
              Get.find<AuthController>().signOut();

              /* Navigator.pop(context); para cerrar menu
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => const Login())));
        */
            },
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(gradient: GradientBlue),
              padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //IMAGEN PIKER

                    GestureDetector(
                      onTap: () async {
                        final pickedImage =
                            picker.pickImage(source: ImageSource.gallery);
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

                    Text("Jhonatan Mejias",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("jhonathan@gmail.com",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14.0,
                            color: Colors.black)),
                  ]),
            )),
        IconButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel_outlined),
          color: Colors.red,
        )
      ],
    );

    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text(
            "Home",
          ),
          leading: const Icon(Icons.home, color: Colors.red),
          trailing: const Icon(Icons.keyboard_arrow_left, color: Colors.red),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => const HomePage())));
          },
        ),
        ListTile(
          title: const Text(
            "Login",
          ),
          leading: const Icon(Icons.login, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            //Navigator.pop(context); para cerrar menu
          },
        ),
        ListTile(
          title: const Text(
            "Login Main",
          ),
          leading: const Icon(Icons.login, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const IntroScreen())));
          },
        ),
        ListTile(
          title: const Text(
            "Registrer",
          ),
          leading: const Icon(Icons.door_front_door, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const RegisterPage())));
          },
        ),
        ListTile(
          title: const Text(
            "Barrier",
          ),
          leading: const Icon(Icons.door_front_door, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const OpenBarrierPage())));
          },
        ),
        ListTile(
          title: const Text(
            "Movimientos",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Depositar",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Comercio",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Soporte",
          ),
          leading: const Icon(Icons.support_agent, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: Colors.black38,
        ),
        ListTile(
          title: const Text(
            "Ajustes",
          ),
          leading: const Icon(Icons.miscellaneous_services, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
      ],
    );
    return drawerItems;
  }
}
