import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

import '../../domain/repositories/abstractas/responsive.dart';

var user = FirebaseAuth.instance.currentUser!;
String inicial = user.email!.substring(0, 1).toUpperCase();

class AppBarBack extends StatelessWidget {
  final title;
  const AppBarBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: sclH(context) * 6,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: sclH(context) * 2.5,
          ),
          tooltip: 'volver',
          onPressed: () {
            Get.offNamed(RouteNames.home);
          }),
      title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: sclH(context) * 2,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
