import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_parking/app/controllers/auth_controller.dart';
import 'package:pay_parking/ui/pages/home/home_page.dart';

import 'package:pay_parking/ui/pages/open_barrier/open_barrier_page.dart';
import 'package:pay_parking/ui/pages/register/register_page.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

import '../../app/controllers/my_user_controller.dart';
import '../../domain/repositories/abstractas/responsive.dart';
import '../pages/intro_main/intro_screen_page.dart';

var user = FirebaseAuth.instance.currentUser!;
var userPicturePath =
    "assets/img/jhonatan_mejias.jpg"; //currentUser.email!.toString();

class DrawerItems extends StatefulWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
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
                            width: sclH(context) * 12,
                            height: sclH(context) * 12,
                            child: imageObx,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sclH(context) * 1,
                    ),
                    Text(UserName(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: sclH(context) * 2.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(user.email.toString(),
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: sclH(context) * 2,
                            color: Colors.white)),
                  ]),
            )),
        IconButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          icon: Icon(
            Icons.cancel_outlined,
            size: sclH(context) * 2,
          ),
          color: Colors.red,
        )
      ],
    );

    final drawerItems = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            "Home",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.home,
            color: Colors.red,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.red,
            size: sclH(context) * 3,
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => const HomePage())));
          },
        ),
        ListTile(
          title: Text(
            "Login",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.login,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {
            //Navigator.pop(context); para cerrar menu
          },
        ),
        ListTile(
          title: Text(
            "Login Main",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.login,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const IntroScreen())));
          },
        ),
        ListTile(
          title: Text(
            "Registrer",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.door_front_door,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const RegisterPage())));
          },
        ),
        ListTile(
          title: Text(
            "Barrier",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.door_front_door,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const OpenBarrierPage())));
          },
        ),
        ListTile(
          title: Text(
            "Movimientos",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.comment,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Depositar",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.comment,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Comercio",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.comment,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Soporte",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.support_agent,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {},
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: Colors.black38,
        ),
        ListTile(
          title: Text(
            "Ajustes",
            style: TextStyle(
              fontSize: sclH(context) * 2.5,
            ),
          ),
          leading: Icon(
            Icons.miscellaneous_services,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: sclH(context) * 3,
          ),
          onTap: () {},
        ),
      ],
    );
    return drawerItems;
  }
}

UserName() {
  var u = user.uid;
  if (u == null) {}
  ;
  //si no tiene nombre mostrar id

  return u;
}
