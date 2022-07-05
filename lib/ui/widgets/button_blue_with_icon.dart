import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

class ButtonBlueWithIcon extends StatelessWidget {
  String textButton = "";
  IconData iconButton = Icons.bluetooth_audio;
  var gradientColor = GradientRed;
  var colorBorder = Colors.pink;

  ButtonBlueWithIcon(
      this.iconButton, this.textButton, this.gradientColor, this.colorBorder);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 54.0,
      width: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: colorBorder,
              blurStyle: BlurStyle.inner,
              offset: Offset(-3.0, 2.0),
              blurRadius: 5,
            )
          ],
          gradient: gradientColor),
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
              color: colorBorder, width: 4.0, style: BorderStyle.solid),
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
