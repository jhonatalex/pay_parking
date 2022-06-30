import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  String textButton = "";

  EmailField(this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(left: 15.0, right: 5.0),
      width: 220.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
          color: Color.fromARGB(76, 250, 250, 250)),
      child: TextFormField(
        restorationId: 'email_field',
        decoration: InputDecoration(
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
    ;
  }
}

class PasswordField extends StatelessWidget {
  String textButton = "";

  PasswordField(this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 15.0, right: 5.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
            color: Color.fromARGB(76, 250, 250, 250)),
        child: TextFormField(
          obscureText: true,
          //maxLength: 8,
          decoration: InputDecoration(
            //filled: true,
            icon: const Icon(Icons.lock_outline),
            labelText: textButton,
            //helperText: "Ingrese 8 dígitos",
            suffixIcon: IconButton(
              onPressed: () {},
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
