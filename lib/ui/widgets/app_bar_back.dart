import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

import '../../app/controllers/auth_controller.dart';

var user = FirebaseAuth.instance.currentUser!;
String inicial = user.email!.substring(0, 1).toUpperCase();

final appBarBack = AppBar(
  backgroundColor: Color.fromARGB(213, 247, 247, 247),
  foregroundColor: Colors.black,
  leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: 'volver',
      onPressed: () {
        Get.offNamed(RouteNames.home);
      }),
  title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(user.email!,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold)),
  ]),
);
