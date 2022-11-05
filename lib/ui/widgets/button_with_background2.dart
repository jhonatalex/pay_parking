import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonWithBackground2 extends StatelessWidget {
  String textButton = "";
  Widget page;

  ButtonWithBackground2(
    this.textButton,
    this.page,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFFFFDF40)),
        child: Center(
          child: TextButton(
              onPressed: () {
                //singIn();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              },
              child: Center(
                child: Text(textButton,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )),
        ));
  }
}
