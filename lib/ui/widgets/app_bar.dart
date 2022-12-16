import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

import '../../app/controllers/auth_controller.dart';

var user = FirebaseAuth.instance.currentUser!;
String inicial = user.email!.substring(0, 1).toUpperCase();

final appBar = AppBar(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Bienvenido...",
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
      Text(user.email!,
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.normal)),
    ],
  ),
  actions: <Widget>[
    PopupMenuButton(
        icon: CircleAvatar(
          child: Text(
            inicial,
            style: const TextStyle(color: Colors.white),
          ),
          //backgroundImage: AssetImage("assets/img/jhonatan_mejias.jpg")
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    Text("Mi Cuenta"),
                  ],
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    Text("Settings"),
                  ],
                )),
            PopupMenuItem<int>(
              value: 2,
              child: Row(
                children: const [
                  Icon(Icons.output),
                  Text("Cerrar Sesion"),
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
        }),
  ],
);
