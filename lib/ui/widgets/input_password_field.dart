// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../domain/repositories/abstractas/responsive.dart';

class PasswordField extends StatefulWidget {
  String textButton = "";
  TextEditingController passwordController;

  PasswordField(this.textButton, this.passwordController, {Key? key})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(left: 10.0),
        width: sclW(context) * 45,
        height: sclW(context) * 45 / 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: const Color(0xFFFFDF40),
                width: 2.0,
                style: BorderStyle.solid),
            color: const Color.fromARGB(76, 250, 250, 250)),
        child: TextFormField(
          style: TextStyle(fontSize: sclW(context) * 3),
          controller: widget.passwordController,
          obscureText: isHidden,
          //maxLength: 8,
          decoration: InputDecoration(
            //filled: true,
            border: InputBorder.none,
            icon: Icon(
              Icons.lock_outline,
              size: sclW(context) * 3,
            ),
            hintText: widget.textButton,
            //helperText: "Ingrese 8 dígitos",
            suffixIcon: IconButton(
              onPressed: togglePasswordVisibility,
              hoverColor: Colors.transparent,
              icon: isHidden
                  ? Icon(
                      Icons.visibility_off,
                      size: sclW(context) * 3,
                    )
                  : Icon(
                      Icons.visibility,
                      size: sclW(context) * 3,
                    ),
            ),
          ),
        ));
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
