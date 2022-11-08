// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputNameField extends StatelessWidget {
  String textButton = "";

  InputNameField(this.textButton, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 10.0),
      width: 220.0,
      height: 50.0,
      decoration: BoxDecoration(
          //boxShadow: [ShadowBlack],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: const Color(0xFFFFDF40),
              width: 2.0,
              style: BorderStyle.solid),
          color: const Color.fromARGB(76, 250, 250, 250)),
      child: TextFormField(
        restorationId: 'email_field',
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(
              fontFamily: "Lato",
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          //filled: true,
          icon: const Icon(Icons.email),
          //hintText: "",
          labelText: textButton,
        ),
      ),
    );
  }
}
