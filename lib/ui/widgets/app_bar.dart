import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser!;
final appBar = AppBar(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Bienvenido...",
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
      Text(user.email!,
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 10.0,
              color: Colors.black,
              fontWeight: FontWeight.normal)),
    ],
  ),
  actions: <Widget>[
    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
    Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: const CircleAvatar(
          backgroundImage: AssetImage("assets/img/jhonatan_mejias.jpg")),
    )
  ],
);
