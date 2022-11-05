import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

class PasswordField extends StatelessWidget {
  String textButton = "";
  TextEditingController passwordController;

  PasswordField(this.textButton, this.passwordController);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 10.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
            color: Color.fromARGB(76, 250, 250, 250)),
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
              onPressed: () {
                print("ver Contraseña");
              },
              hoverColor: Colors.transparent,
              icon: Icon(
                Icons.visibility_off,
              ),
            ),
          ),
        ));
    ;
  }
}
