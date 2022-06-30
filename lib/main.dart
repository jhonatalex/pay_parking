import 'package:flutter/material.dart';

import 'ui/pages/login_main/login_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(body: Center(child: LoginMain())),
    );
  }
}
