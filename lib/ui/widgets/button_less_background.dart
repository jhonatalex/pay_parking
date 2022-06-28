import 'package:flutter/material.dart';

class ButtonLessBackground extends StatelessWidget {
  String textButton = "";

  ButtonLessBackground(this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
            color: Color.fromARGB(76, 250, 250, 250)),
        child: Center(
          child: TextButton(
              onPressed: () {
                print("Button pressed");
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
    ;
  }
}
