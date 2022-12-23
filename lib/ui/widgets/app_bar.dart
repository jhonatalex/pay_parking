import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/domain/repositories/abstractas/responsive.dart';

///import 'package:pay_parking/data/login_firebase/auth_firebase.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

import '../../app/controllers/auth_controller.dart';

var user = FirebaseAuth.instance.currentUser!;
String inicial = user.email!.substring(0, 1).toUpperCase();

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return AppBar(
      key: _scaffoldKey,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            size: sclH(context) * 2.5,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      toolbarHeight: sclH(context) * 6,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Bienvenido...",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: sclH(context) * 2,
                  color: const Color.fromARGB(255, 80, 70, 70),
                  fontWeight: FontWeight.bold)),
          Text(user.email!,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: sclH(context) * 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.normal)),
        ],
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: sclH(context) * 2.5,
            )),
        const CircleImage(),
      ],
    );
  }
}

class CircleImage extends StatefulWidget {
  const CircleImage({
    Key? key,
  }) : super(key: key);

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        iconSize: sclH(context) * 3.5,
        icon: CircleAvatar(
          radius: sclH(context) * 3.5,
          child: Text(
            user.email!.toUpperCase().substring(0, 1),
            style:
                TextStyle(color: Colors.white, fontSize: sclH(context) * 2.5),
          ),

          //backgroundImage: AssetImage("assets/img/jhonatan_mejias.jpg")
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
                height: sclH(context) * 5,
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: sclH(context) * 2.5,
                    ),
                    Text(
                      "Mi Cuenta",
                      style: TextStyle(fontSize: sclH(context) * 2),
                    ),
                  ],
                )),
            PopupMenuItem<int>(
                height: sclH(context) * 5,
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: sclH(context) * 2.5,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: sclH(context) * 2),
                    ),
                  ],
                )),
            PopupMenuItem<int>(
              height: sclH(context) * 5,
              value: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.output,
                    size: sclH(context) * 2.5,
                  ),
                  Text(
                    "Cerrar Sesion",
                    style: TextStyle(fontSize: sclH(context) * 2),
                  ),
                ],
              ),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            Get.offNamed(RouteNames.profile);
          } else if (value == 1) {
          } else if (value == 2) {
            Get.find<AuthController>().signOut();
            Get.offNamed(RouteNames.intro);
          }
        });
  }
}
