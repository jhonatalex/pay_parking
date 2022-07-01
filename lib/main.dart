import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';

import 'ui/pages/login/login.dart';
import 'ui/pages/login_main/login_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, //Quitar el banner demo
      home: Scaffold(body: Center(child: home())),
    );
  }
}
