import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

// ignore: must_be_immutable
class ButtonBlueWithIcon extends StatelessWidget {
  String textButton = "";
  IconData iconButton = Icons.bluetooth_audio;
  Widget page;

  ButtonBlueWithIcon(this.iconButton, this.textButton, this.page, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 54.0,
      width: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurStyle: BlurStyle.inner,
              offset: Offset(-3.0, 2.0),
              blurRadius: 5,
            )
          ],
          gradient: GradientBlue),
      child: Icon(iconButton, color: Colors.black, size: 30.0),
    );

    final banner = Container(
      margin: const EdgeInsets.only(top: 2.0, left: 10.0),
      padding: const EdgeInsets.only(left: 50.0, right: 5.0),
      width: 220.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.blue, width: 4.0, style: BorderStyle.solid),
          color: const Color.fromARGB(76, 250, 250, 250)),
      child: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            child: Center(
              child: Text(textButton,
                  style: const TextStyle(
                      fontFamily: "Lato",
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [banner, card],
      ),
    );
  }
}
