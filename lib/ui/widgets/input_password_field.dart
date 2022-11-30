// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  String textButton = "";
  TextEditingController passwordController;

  PasswordField(this.textButton, this.passwordController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(left: 10.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: const Color(0xFFFFDF40),
                width: 2.0,
                style: BorderStyle.solid),
            color: const Color.fromARGB(76, 250, 250, 250)),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          //maxLength: 8,
          decoration: InputDecoration(
            //filled: true,
            border: InputBorder.none,
            icon: const Icon(Icons.lock_outline),
            labelText: textButton,
            //helperText: "Ingrese 8 dígitos",
            suffixIcon: IconButton(
              onPressed: () {},
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.visibility_off,
              ),
            ),
          ),
        ));
  }
}
