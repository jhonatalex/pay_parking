import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';

import 'ui/pages/login/login.dart';
import 'ui/pages/login_main/login_main.dart';

void main() {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, //Quitar el banner demo
      home: Scaffold(body: Center(child: Home())),
    );
  }
}
