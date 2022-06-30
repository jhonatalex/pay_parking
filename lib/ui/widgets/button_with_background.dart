import 'package:flutter/material.dart';

class ButtonWithBackground extends StatelessWidget {
  String textButton = "";

  ButtonWithBackground(this.textButton);

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
  }
}
