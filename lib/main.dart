import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/pages/login_main/login_main.dart';

void main() {
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, //Quitar el banner demo
      home: Scaffold(body: Center(child: LoginMain())),
    );
  }
}
