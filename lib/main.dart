import 'package:flutter/material.dart';

import 'ui/pages/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pay Parking'),
        ),
        body: Center(
          child: Login(),
        ),
      ),
    );
  }
}
