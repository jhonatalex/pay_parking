import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///import 'package:pay_parking/data/login_firebase/auth_firebase.dart';
import 'package:pay_parking/ui/routes/route_names.dart';

import '../../data/login_firebase/auth_repositoryAbst.dart';

final _authRepository = Get.find<AuthRepository>();

//String inicial = authUser.email!.substring(0, 1).toUpperCase();

var appBar = AppBar(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  title: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Text("Bienvenido...",
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 20.0,
              color: Color.fromARGB(255, 80, 70, 70),
              fontWeight: FontWeight.bold)),
      Text("currentUser.email!",
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.normal)),
    ],
  ),
  actions: <Widget>[
    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    const CircleImage(),
  ],
);

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: CircleAvatar(
          child: Text(
            "inicial",
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
                    Text("  My Account"),
                  ],
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    Text("  Settings"),
                  ],
                )),
            PopupMenuItem<int>(
              value: 2,
              child: Row(
                children: const [
                  Icon(Icons.output),
                  Text("  Logout"),
                ],
              ),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
          } else if (value == 1) {
          } else if (value == 2) {
            FirebaseAuth.instance.signOut();

            Get.offNamed(RouteNames.loginMain);
          }
        });
  }
}
