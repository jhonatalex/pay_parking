import 'package:flutter/material.dart';

class ButtonBlueWithIcon extends StatelessWidget {
  String textButton = "";
  IconData iconButton = Icons.bluetooth_audio;

  ButtonBlueWithIcon(this.iconButton, this.textButton);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 54.0,
      width: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFF2196f3),
        /*gradient: LinearGradient(
            colors: [
              Color(0xff426bd3),
              Color(0xff5d4bd1),
            ],
          )*/
      ),
      child: Icon(iconButton, color: Colors.black, size: 30.0),
    );

    final banner = Container(
      margin: const EdgeInsets.only(top: 2.0, left: 10.0),
      padding: EdgeInsets.only(left: 50.0, right: 5.0),
      width: 210.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Color(0xFF2196f3), width: 2.0, style: BorderStyle.solid),
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
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [banner, card],
      ),
    );
    ;
  }
}
