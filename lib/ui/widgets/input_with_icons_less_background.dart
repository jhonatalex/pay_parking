import 'package:flutter/material.dart';

class Input2IconsLessBackground extends StatelessWidget {
  String textButton = "";
  Widget firtIcon = Icon(Icons.lock_outline);
  Widget secondIcon = Icon(Icons.visibility_off);

  Input2IconsLessBackground(this.firtIcon, this.textButton, this.secondIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
            color: Color.fromARGB(76, 250, 250, 250)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              firtIcon,
              Text(textButton,
                  style: const TextStyle(
                      fontFamily: "Lato",
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              secondIcon,
            ]));
    ;
  }
}

class Input1IconLessBackground extends StatelessWidget {
  String textButton = "";
  Widget firtIcon = Icon(Icons.email);

  Input1IconLessBackground(this.firtIcon, this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Color(0xFFFFDF40), width: 2.0, style: BorderStyle.solid),
            color: Color.fromARGB(76, 250, 250, 250)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              firtIcon,
              Text(textButton,
                  style: const TextStyle(
                      fontFamily: "Lato",
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ]));
    ;
  }
}
