import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

final appBar = AppBar(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Bienvenido...",
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
      Text("Jhonatan Mejias",
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 10.0,
              color: Colors.black,
              fontWeight: FontWeight.normal)),
    ],
  ),
  actions: <Widget>[
    IconButton(
        onPressed: () {
          print("Button icon more pressed");
        },
        icon: Icon(Icons.more_vert_rounded)),
    Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: CircleAvatar(
          backgroundImage: AssetImage("assets/img/jhonatan_mejias.jpg")),
    )
  ],
);
