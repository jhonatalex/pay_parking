// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonSingIn extends StatelessWidget {
  String textButton = "";
  Widget page;
  TextEditingController email_user;
  TextEditingController password_user;

  ButtonSingIn(
    this.textButton,
    this.email_user,
    this.password_user,
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
            color: const Color(0xFFFFDF40)),
        child: Center(
          child: TextButton(
              onPressed: () {
                singIn();

                /* Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));*/
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

  Future singIn() async {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email_user.text, password: password_user.text);

    debugPrint('movieTitle: $result');
  }
}
